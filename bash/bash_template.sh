#!/bin/bash

echo "### Title ###"

# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from %dirname%"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

echo "#############"
