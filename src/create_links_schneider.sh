#!/bin/bash

echo "### Create Links Schneider ###"

cd "$(dirname "$0")"
bash_dir="$(pwd)"
echo "Bash Directory ${bash_dir}"

#TODO(Roger) - Ask the user for the namespace folder
cd ../../../
workspace_dir="$(pwd)"
echo "Roger Directory ${workspace_dir}"

#Go to the current file folder
cd "${bash_dir}"

echo "- Execute links for vim machine -"
./create_links_vim_machine.sh

echo "- Replace Shortcuts - "

echo "- Replace Configuration Files - "
rm -f ~/.bashrc
ln -s -n "${bash_dir}/environment/linux/bashrc_schneider" ~/.bashrc

echo "#############"
