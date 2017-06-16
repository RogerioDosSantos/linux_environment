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
file_dir="/home/links/safe"
read -e -p "Please enter the Safe file directory: " -i "$file_dir" file_dir

name="safe00"
read -e -p "Please enter the Safe name: " -i "$name" name

# Set Internal variables
file_path="$file_dir/$name.img"
safe_folder_dir="/root/$name"
volume_name="$name"
volume_dir="/dev/mapper/$volume_name"

# Check if the file already exist
if [[ ! -f $file_path ]]; then
  echo "The file $file_path does not exist. Aborting..."
  exit
fi

echo " - Mapping the container into a volume on the following path: $volume_dir"
cryptsetup luksOpen $file_path $volume_name
  
echo " - Mapping the new volume on the following folder: $safe_folder_dir"
mkdir $safe_folder_dir
mount $volume_dir $safe_folder_dir
cd $safe_folder_dir

echo "#############"
