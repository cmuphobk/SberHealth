#!/bin/bash

# Tells the shell script to exit if it encounters an error
# set -e

# Checks if executable exists in current path
command_exists () {
  command -v "$1" > /dev/null 2>&1;
}

# Logging

function log {
    echo -e "\033[0m➜ $1"
}
function log_ok {
    echo -e "\033[92m✔ $1"
    echo "--------------------------------------------------------"
}
function log_warn {
    echo -e "\033[33m Warning: $1"
}
function log_info {
    echo -e "\033[0m\033[7m Info: $1"
}

# Stages

function homebrew_install {
    log "Homebrew installation started."
    if ! command_exists brew
    then
        # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        if test -d "/opt/homebrew/bin/"; then
            git -C /opt/homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
        else
            git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
        fi
        
        brew update
    fi
    update_path "/opt/homebrew/bin/"
    
    log_ok "Homebrew successfully installed."
}


function rbenv_install {
    log "rbenv installation started."
    pwd_path=$(pwd)
    if ! command_exists rbenv
    then
        brew install rbenv
        brew upgrade rbenv ruby-build
    fi
    update_path "$HOME/.rbenv/bin"
    rbenv init
    log_ok "rbenv successfully installed."
}

function update_path {
    if test -d $1; then
        BIN="${1}:"
        if ! [[ "${PATH}" == *"$BIN"* ]]; then
            PATH="${1}:${PATH}"
            zshrc_change "export PATH=\"${PATH}\"" true
            bash_profile_change "export PATH=\"${PATH}\"" true
        fi
    fi
}

function write_to_file {
    if ! grep -Fxq "$1" "$2"
    then
        if $3
        then
            echo "$1" | cat - "$2" > temp && mv temp "$2"
        else
            echo "$1" >> "$2"
        fi
    fi
}

function zshrc_change {
    write_to_file "$1" ~/.zshrc $2
    source ~/.zshrc
}

function bash_profile_change {
    write_to_file "$1" ~/.bash_profile $2
    source ~/.bash_profile
}

function ruby_install {
    log "Ruby installation started."
    log "$(cat .ruby-version)"
    ruby_version="$(cat .ruby-version)"

    rbenv_version_command_str="$(rbenv version)"
    IFS=' '
    read -ra ADDR <<< "$rbenv_version_command_str"
    if [ "$ruby_version" = "${ADDR[0]}" ]; then
        log_ok "Ruby ${ruby_version} already installed!"
        return
    fi

    rbenv install "${ruby_version}"
    log_ok "Ruby successfully installed."
}

function bundler_install {
    log "Bundler installation started."
    bundle_version_command_str="$(bundle -v)"
    bundler_version="$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1 | sed 's/^ *//g')"
    read -ra ADDR <<< "$bundle_version_command_str"

    log "Result of bundle -v: ${bundle_version_command_str}"
    log "Version in Gemfile.lock: ${bundler_version}"

    if [ "$bundler_version" = "${ADDR[2]}" ]; then
        log_ok "Bundler ${bundler_version} already installed!"
        return
    fi
    gem install bundler -v "${bundler_version}"
    log_ok "Bundler successfully installed."
}

function bundle_install {
    log "Bundle installation started."
    bundle config set --local path "./vendor"
    bundle install
    log_ok "Bundle successfully installed."
}

function cloc_install {
    log "cloc installation started."
    if ! command_exists cloc
    then
        brew install cloc
    fi
    brew upgrade cloc
    log_ok "cloc successfully installed."
}

function xclogparser_install {
    log "xclogparser installation started."
    if ! command_exists xclogparser
    then
        brew install xclogparser
    fi
    brew upgrade xclogparser
    log_ok "xclogparser successfully installed."
}

function tuist_install {
    log "tuist installation started."
    if ! command_exists tuist
    then
        curl -Ls https://install.tuist.io | bash
    fi
    log_ok "tuist successfully installed."
    tuist update
}

# shared variables
prefix=/usr/local
bindir=$prefix/bin
libdir=$prefix/lib

function bootstrap {
    log "bootstrap started!"

    # setup in project_folder
    homebrew_install
    zshrc_change 'eval "$(brew shellenv)"' false
    bash_profile_change 'eval "$(brew shellenv)"' false
    rbenv_install
    zshrc_change 'eval "$(rbenv init -)"' false
    bash_profile_change 'eval "$(rbenv init -)"' false
    log "ruby -v: $(ruby -v)"
    ruby_install
    bundler_install
    bundle_install
    tuist_install
    cloc_install
    xclogparser_install
    tuist generate --no-open --no-cache
    bundle exec xcode-build-times install . --events-file .timings.xcode

    log_ok "bootstrap successfully finished!"
}

# path from which we started executing
from_path=$(pwd)
# script located in project_folder/dodoc/scripts
script_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# go to script folder
cd $script_dir
# go to project folder
cd ../

bootstrap

# go to path from which we started executing
cd ${from_path}