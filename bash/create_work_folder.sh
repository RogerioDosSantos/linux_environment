#!/bin/bash

# Configuration
echo "* $(basename "$0")"
echo "- Configuration:"

config_folder_name="$1"
echo "  1- config_folder_name: ${config_folder_name}"

if [ "${config_folder_name}" = "" ]; then
  echo "Error: Invalid Configuration" 
  exit
fi

# Setup - Go to the directory where the bash file is
call_dir=$(pwd)
cd "$(dirname "$0")"
bash_dir=$(pwd)
echo "- Called from ${call_dir}"
echo "- Running from ${bash_dir}"
cd "$(dirname "$0")"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

# Instructions

echo "- Creating work folder"
cd "${call_dir}"
mkdir ./${config_folder_name}
cd ./${config_folder_name}
touch ./README.md

echo "- Creating doc folder"
mkdir ./doc
mkdir ./doc/resource
mkdir ./doc/src
echo "${config_folder_name} Documentation" > ./doc/src/index.md

echo "- Initializing git"
git init
git add .
git commit -m "${config_folder_name} folder creation"

# Setup - Return to the called directory
cd "${call_dir}"

