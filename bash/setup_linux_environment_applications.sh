#!/bin/bash
cd "$(dirname "$0")"

echo "### Linux Environment Application Setup ###"

echo ""
echo "--- Defining variables ---"

user_bin_dir="${HOME}/bin"
echo "User Directory: ${user_bin_dir}"

echo ""
echo "--- Getting Programs ---" 

echo: "Note: You will need to run as super user)"

echo ""
echo "- apt-get -"
sudo apt-get update
sudo apt-get upgrade

echo ""
echo "- Git -"
sudo apt-get -y install git

echo ""
echo "- Sync and Backup -"
sudo apt-get -y install rsync

echo ""
echo "- Chryptography -"
sudo apt-get -y install encfs

echo ""
echo "- Build Essentials -"
sudo apt-get -y install build-essential cmake python-dev

echo ""
echo "- TMUX -"
sudo apt-get -y install tmux

echo ""
echo "- NodeJS -"
sudo apt-get -y install nodejs npm
sudo npm -y install -g typescript

echo ""
echo "- Text Editors -"
sudo apt-get -y install vim

echo ""
echo " - Programming tools -"
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install ctags
sudo apt-get -y install clang clang-format-3.5 clang-modernize-3.5
sudo apt-get -y install cppcheck
