#!/bin/bash

echo "### Vim Machine - Creating Links ###"

#Go to the current file folder
cd "$(dirname "$0")"
echo "Running from $(pwd)"

echo "- Configuration Files - "
rm -f ~/.tmux.conf
ln -s -n ~/.linux/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.vim
ln -s -n ~/.linux/vim/vim ~/.vim
rm -f ~/.vimrc
ln -s -n ~/.linux/vim/vimrc ~/.vimrc
rm -f ~/.vimrc.bundles
ln -s -n ~/.linux/vim/vimrc.bundles ~/.vimrc.bundles
rm -f ~/.syntastic_cpp_config
ln -s -n ~/.linux/syntastic/syntastic_cpp_config_schneider ~/.syntastic_cpp_config

echo "- Shortcuts - "
rm -f ~/bash
ln -s -n ~/.linux/bash ~/bash
rm -f ~/wiki
ln -s -n ~/host/git/wiki ~/wiki
rm -f ~/temp
ln -s -n ~/host/temp ~/temp

echo "#############"
