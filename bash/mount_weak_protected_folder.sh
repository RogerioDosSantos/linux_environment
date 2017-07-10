#!/bin/bash

echo "### encfs - Mount Protected Folder ###"

# Ensure that run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from $(pwd)"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

# Get User information
file_dir="/home/links/safe"
read -e -p "Please enter the Safe file directory: " -i "$file_dir" file_dir

name="safe00"
read -e -p "Please enter the Safe name: " -i "$name" name

:q

