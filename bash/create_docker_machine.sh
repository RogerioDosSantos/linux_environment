#!/bin/bash

echo "### Create Docker Machine ###"

# Ensure that run as root
# if [ "$EUID" -ne 0 ]
#   then echo "This program must be run with administrator privileges.  Aborting"
#   exit
# fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

# Request machine configuration
machine_name="boot2docker"
read -e -p "Please enter the Machine name: " -i "$machine_name" machine_name

cpu_count="1"
read -e -p "Please enter the amount of CPUs: " -i "$cpu_count" cpu_count

disk_size="10000"
read -e -p "Please enter the max disk size (MB): " -i "$disk_size" disk_size

memory_size="512"
read -e -p "Please enter the memory size (MB): " -i "$memory_size" memory_size

# Get Proxy Configuration
proxy_url=$(printenv http_proxy | sed 's|http_proxy=||g')

# Create a Boot2Docker Machine
if [[ ! -z $proxy_url ]]; then
  echo "Using Proxy: $proxy_url"
  docker-machine create $machine_name -d virtualbox \
    --engine-env http_proxy=$proxy_url \
    --engine-env https_proxy=$proxy_url \
    --virtualbox-cpu-count $cpu_count \
    --virtualbox-disk-size $disk_size \
    --virtualbox-memory $memory_size
else
  docker-machine create $machine_name -d virtualbox \
    --virtualbox-cpu-count $cpu_count \
    --virtualbox-disk-size $disk_size \
    --virtualbox-memory $memory_size
fi

echo "#############"
