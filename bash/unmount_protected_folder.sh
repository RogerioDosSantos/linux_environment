#!/bin/bash

echo "### dm-crypt - Mount Protected Folder ###"

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
name="safe00"
read -e -p "Please enter the Safe name: " -i "$name" name

# Set Internal variables
safe_folder_dir="/root/$name"
volume_name="$name"
volume_dir="/dev/mapper/$volume_name"

echo " - Unmounting the filesystem."
umount $safe_folder_dir

echo " - Closing volume"
cryptsetup luksClose $volume_dir

echo " - Removing folder"
rm -r $safe_folder_dir

echo "#############"
