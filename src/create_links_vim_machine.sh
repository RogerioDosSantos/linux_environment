#!/bin/bash

echo "### Vim Machine - Creating Links ###"

cd "$(dirname "$0")"
bash_dir="$(pwd)"
echo "Bash Directory ${bash_dir}"

#TODO(Roger) - Ask the user for the namespace folder
cd ../../../
workspace_dir="$(pwd)"
echo "Roger Directory ${workspace_dir}"

#Go to the current file folder
cd "${bash_dir}"

echo "- Shortcuts - "
rm -f ~/roger
ln -s -n "${workspace_dir}" ~/roger
rm -f ~/wiki
ln -s -n "${workspace_dir}/projects/wiki" ~/wiki
rm -f ~/temp
ln -s -n "${workspace_dir}/temp" ~/temp

echo "- Configuration Files - "
rm -f ~/.bashrc
ln -s -n "${bash_dir}/environment/linux/bashrc_roger" ~/.bashrc
rm -f ~/.gitconfig
ln -s -n "${bash_dir}/environment/git/gitconfig" ~/.gitconfig
rm -f ~/.tmux.conf
ln -s -n "${bash_dir}/environment/tmux/tmux.conf" ~/.tmux.conf
rm -f ~/.tmux
ln -s -n "${bash_dir}/environment/tmux/tmux" ~/.tmux
rm -f ~/.vim
ln -s -n "${bash_dir}/environment/vim/vim" ~/.vim
rm -f ~/.vimrc
ln -s -n "${bash_dir}/environment/vim/vimrc" ~/.vimrc
rm -f ~/.vimrc.bundles
ln -s -n "${bash_dir}/environment/vim/vimrc.bundles" ~/.vimrc.bundles
rm -f ~/.syntastic_cpp_config
ln -s -n "${bash_dir}/environment/syntastic/syntastic_cpp_config_schneider" ~/.syntastic_cpp_config
rm -f ~/.marvim
ln -s -n "${bash_dir}/environment/marvim" ~/.marvim
rm -f ~/.editorconfig
ln -s -n "${bash_dir}/environment/editorconfig/editorconfig" ~/.editorconfig

echo "#############"
