#!/bin/bash

echo Setting up Links:

echo - dot files / folders
rm -f ~/.tmux.conf
ln -s -n ~/host/git/scripts/tmux/tmux.conf ~/.tmux.conf

echo - Shortcuts
rm -f ~/bash
ln -s -n ~/host/git/scripts/bash ~/bash
