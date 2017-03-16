#!/bin/bash

echo "### Gogs - Data folder mount ###"

# Ensure that run as root
if [ "$EUID" -ne 0 ]; then
  echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

mkdir /data
mkdir /data/gogs
mount /dev/sdb5 ~/data/gogs

echo "#############"
