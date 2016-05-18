#!/bin/bash
cd "$(dirname "$0")"

echo "### Linux Environment Application Setup ###"

echo ""
echo "--- Defining variables ---"

user_bin_dir="${HOME}/bin"
echo "User Directory: ${user_bin_dir}"

echo ""
echo "--- Getting Programs ---" 

echo "Note: You will need to run as super user)"

echo ""
echo "- apt-get -"
sudo apt-get update
sudo apt-get upgrade

echo ""
echo "- Git -"
sudo apt-get -y install git

echo ""
echo "- Sync and Backup -"
sudo apt-get -y install rsync

echo ""
echo "- Chryptography -"
sudo apt-get -y install encfs

echo ""
echo "- Build Essentials -"
sudo apt-get -y install build-essential cmake python-dev

echo ""
echo "- TMUX -"
sudo apt-get -y install tmux

echo ""
echo "- NodeJS -"
sudo apt-get -y install nodejs npm
sudo npm -y install -g typescript

echo ""
echo "- Text Editors -"
sudo apt-get -y install vim

echo ""
echo " - Programming tools -"
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install ctags
# sudo apt-get -y install libclang1-3.5

echo ""
echo " - Clang"

mkdir -p "${user_bin_dir}"
cd ${user_bin_dir}
mkdir -p "./temp"
wget -O "./temp/clang_intaller.tar.xz" "http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz"
tar xvfJ "./temp/clang_intaller.tar.xz" -C .
mv "./clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04" "./clang_3.8.0"
rm -rf "./temp"
ln -s "./clang_3.8.0/bin/clang" .
ln -s "./clang_3.8.0/bin/clang-format" .



