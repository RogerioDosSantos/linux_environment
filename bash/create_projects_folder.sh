#!/bin/bash

echo "### Create Projects folder ###"

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

mkdir -p ~/projects

ln -s ~/host/work/PRODUCT/ThirdParty/boost1.55 ~/projects/boost
ln -s ~/host/work/PRODUCT/ThirdParty/gtest-1.7.0 ~/projects/gtest

echo "#############"
