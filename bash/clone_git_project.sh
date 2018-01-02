#!/bin/bash

# Configuration
echo "* $(basename "$0")"
echo "- Configuration:"
config_url="$1"
echo "1- config_url: ${config_url}"

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
cd "${call_dir}"
git clone ${config_url}
git submodule update --init --recursive --remote

# Setup - Return to the called directory
cd "${call_dir}"

