source "https://rubygems.org"

gem 'fastlane', '2.205.2'
gem 'xcode-install', '2.8.0'
gem 'xcode-build-times', git: 'https://github.com/PaulTaykalo/xcode-build-times-rendering'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
