#!/bin/bash

echo Setting up Links:

echo - dot files / folders
ln -s ~/git/linux_environment ~/.linux
ln -s ~/.linux/dot_folders/vim ~/.vim
ln -s ~/.linux/dot_folders/vimrc ~/.vimrc
ln -s ~/.linux/dot_folders/bash/bashrc ~/.bashrc
ln -s ~/.linux/dot_folders/bash/aliases ~/.bash_aliases

echo - Shortcuts
ln -s ~/.linux/bash ~/bash

