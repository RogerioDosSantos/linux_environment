#!/bin/bash

echo Setting up Links:

echo - dot files / folders
ln -s -n ~/git/linux_environment ~/.linux
ln -s -n ~/.linux/dot_folders/vim ~/.vim
ln -s -n ~/.linux/dot_folders/vimrc ~/.vimrc
ln -s -n ~/.linux/dot_folders/bash/bashrc ~/.bashrc
ln -s -n ~/.linux/dot_folders/bash/aliases ~/.bash_aliases

echo - Shortcuts
ln -s -n ~/.linux/bash ~/bash

