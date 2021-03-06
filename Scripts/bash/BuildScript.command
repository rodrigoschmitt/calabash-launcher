#!/bin/bash --login
# Path
file=${3}/Gemfile
if [ ! -e "$file" ]; then
echo $file
echo "The path to Calabash folder is incorrect; please choose the right one. File chooser is in the app Settings"
exit
fi

# Debug mode
export ${1}
# Device Target
export ${2}
# Env variables (can be empty)
${6}
# Command to execute before run. User defined (can be empty)
${7}
# Device IP (can be empty)
${8}
# Device bundle identifier
${9}
# Path
cd ${3}

if [[ $(bundle check) != *"The Gemfile's dependencies are satisfied"* ]];then
echo "Installing missing Gems"
bundle install
fi
# Path, Profile, Tag
bundle exec cucumber -c ${4} ${5}
exit
