#!/bin/bash

echo "### Docker Machine - Links Setup ###"

# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges. Aborting..."
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from: $(pwd)"

echo - Linux Environment -
rm -f ~/.linux
ln -s -n ~/git/linux_environment ~/.linux

echo - dot files / folders
rm -f /etc/rc.local
ln -s -n ~/.linux/linux/etc_rc.local_docker_machine /etc/rc.local
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
