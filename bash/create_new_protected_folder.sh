#!/bin/bash

echo "### dm-crypt - New Protected Folder ###"

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
file_dir="/root/host/safe"
read -e -p "Please enter the Safe file directory: " -i "$file_dir" file_dir

name="safe00"
read -e -p "Please enter the Safe name: " -i "$name" name

file_size="512"
read -e -p "Please enter the Safe file size (MB): " -i "$file_size" file_size

# Set Internal variables
file_path="$file_dir/$name.img"
safe_folder_dir="/root/$name"
volume_name="$name"
volume_dir="/dev/mapper/$volume_name"

# Check if the file already exist
if [[ -f $file_path ]]; then
  echo "the file $file_path already exist. Aborting..."
  exit
fi

echo ""
echo "Creating a new safe folder as following:"
echo ""
echo "Image File Path: $file_path"
echo "Safe folder Directory: $safe_folder_dir"
echo ""
create_secure_folder="y"
read -r -p "Are you sure we want to continue? [y/N] " create_secure_folder
if [[ "$create_secure_folder" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
  echo " - Creating a non-sparse randomly filled file. This might take some time."
  dd if=/dev/urandom of=$file_path bs=1M count=$file_size
  
  echo " - Creating dm-crypt LUKS Container in the File"
  cryptsetup -y luksFormat $file_path
  
  echo " - Maping the container into a volume on the following path: $volume_dir"
  cryptsetup luksOpen $file_path $volume_name
  
  echo " - Creating the file system."
  mkfs.ext4 -j $volume_dir
  
  echo " - Mapping the new volume on the following folder: $safe_folder_dir"
  mkdir $safe_folder_dir
  mount $volume_dir $safe_folder_dir
  cd $safe_folder_dir
fi

echo "#############"
