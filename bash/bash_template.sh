#!/bin/bash

# Configuration
echo "* $(basename "$0")"
echo "- Configuration:"
# config_xxx="$1"
# echo "1- config_xxx: ${config_xxx}"

# Setup - Go to the directory where the bash file is
call_dir=$(pwd)
cd "$(dirname "$0")"
bash_dir=$(pwd)
echo "- Called from ${call_dir}"
echo "- Running from ${bash_dir}"
cd "$(dirname "$0")"

# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

# Exit on any non-zero status.
trap 'exit' ERR
set -E

# Instructions
echo "TODO: Add Instructions here"

# Setup - Return to the called directory
cd "${call_dir}"

