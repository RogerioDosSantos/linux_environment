#!/bin/bash

echo Setting up Links:

echo - Linux Environment -
rm -f ~/.linux
ln -s -n ~/git/linux_environment ~/.linux

echo - dot files / folders
rm -f ~/.tmux.conf
ln -s -n ~/.linux/tmux/tmux.conf ~/.tmux.conf

echo - Shortcuts
rm -f ~/bash
ln -s -n ~/.linux/bash ~/bash
