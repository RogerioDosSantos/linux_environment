#!/bin/bash

echo "### Bash functions Test ###"

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from $(pwd)"

# Load Functions
. ./bash_functions.sh

proxy_url=$(GetProxyName) 
echo "proxy_url: $proxy_url"

echo "#############"
