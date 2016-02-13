#!/bin/bash

echo Setting up Links:

echo - dot files / folders
ln -s -n ~/git/linux_environment ~/.linux
ln -s -n ~/.linux/dot_folders/vim ~/.vim
ln -s -n ~/.linux/dot_folders/vimrc ~/.vimrc

echo - Shortcuts
ln -s -n ~/.linux/bash ~/bash

