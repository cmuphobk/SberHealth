# path from which we started executing
from_path=$(pwd)
# script located in project_folder/dodoc/scripts
script_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# go to script folder
cd $script_dir
# go to project folder
cd ../

git clean -xdf

./scripts/bootstrap.sh

bundle exec fastlane build_for_testing device:"iPhone 11"
xclogparser parse --project SberHealth --reporter html --derived_data ./DerivedData --without_build_specific_information
bundle exec xcode-build-times generate --events-file .timings.xcode
cloc . --out=.cloc_report --exclude-dir=xcshareddata,Frameworks,Pods,vendor,Templates

# go to path from which we started executing
cd ${from_path}