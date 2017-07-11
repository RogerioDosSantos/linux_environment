#!/bin/bash

echo "### Install required Application for Linux Kernel Modules development ###"

# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

apt-get update
apt-cache search linux-headers-$(uname -r)


echo "#############"
