#!/bin/bash

echo "### Babun Machine - Links Setup ###"

# Ensure that run as root
# if [ "$EUID" -ne 0 ]
#   then echo "This program must be run with administrator privileges. Aborting..."
#   exit
# fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from: $(pwd)"

echo - Linux Environment -

echo - Environment folder
rm -f ~/.linux
ln -s -n /c/Users/roger/git/linux_environment ~/.linux

echo - Host folder
rm -f ~/host
ln -s -n /c/Users/roger ~/host

echo - dot files / folders
rm -f ~/.tmux.conf
ln -s -n ~/.linux/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.gitconfig
ln -s -n ~/.linux/git/gitconfig ~/.gitconfig

echo - Shortcuts
rm -f ~/bash
ln -s -n ~/.linux/bash ~/bash
rm -f ~/docker
ln -s -n ~/host/git/docker ~/docker

echo "#############"
