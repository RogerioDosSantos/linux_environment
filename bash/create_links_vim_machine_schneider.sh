#!/bin/bash

#Go to the current file folder
cd "$(dirname "$0")"

echo "### Vim Machine - Creating Schneider Links ###"

echo ""
echo "- Linux Environment - "
#rm -f ~/.linux
#ln -s -n ~/host/git/linux_environment ~/.linux

echo ""
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

echo ""
echo "- Shortcuts - "
rm -f ~/bash
ln -s -n ~/.linux/bash ~/bash
rm -f ~/wiki
ln -s -n ~/host/git/wiki ~/wiki
rm -f ~/temp
ln -s -n ~/host/temp ~/temp
rm -f ~/wiki_indusoft
ln -s -n ~/host/git/indusoft ~/wiki_indusoft
rm -f ~/work
ln -s -n ~/host/work ~/work
rm -f ~/dev
ln -s -n ~/host/work/PRODUCT/DEV ~/dev
rm -f ~/third-party
ln -s -n ~/host/work/PRODUCT/ThirdParty ~/third-party
