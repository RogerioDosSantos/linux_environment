#!/bin/bash

echo "Getting Programs (You will need to run as super user)"

echo "- apt-get"
sudo apt-get update
sudo apt-get upgrade

echo "- Git"
sudo apt-get -y install git

echo "- Sync and Backup"
sudo apt-get -y install rsync

echo "- Chryptography"
sudo apt-get -y install encfs

echo "- Build Essentials"
sudo apt-get -y install build-essential cmake python-dev

echo "- TMUX"
sudo apt-get -y install tmux

echo "- NodeJS"
sudo apt-get -y install nodejs npm
sudo npm -y install -g typescript

echo "- Text Editors"
sudo apt-get -y install vim

echo " - Programming tools"
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install ctags
sudo apt-get -y install libclang1-3.5
