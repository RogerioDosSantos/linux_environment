#!/bin/bash

echo "### Set a fix IP into a Docker Machine ###"

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

# Exit on any non-zero status.
trap 'exit' ERR
set -E

# Request machine configuration
machine_name="boot2docker"
read -e -p "Please enter the Machine name that you want to set the IP: " -i "$machine_name" machine_name

machine_ip="192.168.99.10"
read -e -p "Please enter the desired Machine IP: " -i "$machine_ip" machine_ip

machine_base_ip=`echo $machine_ip | cut -d"." -f1-3`
echo "Machine base ip: $machine_base_ip"

# Get Proxy Configuration
proxy_url=$(printenv http_proxy | sed 's|http_proxy=||g')

# Set the Machine IP
echo "Adding command to bootsync.sh: kill \$(more /var/run/udhcpc.eth1.pid)" 
echo "kill \$(more /var/run/udhcpc.eth1.pid)" | docker-machine ssh $machine_name sudo tee /var/lib/boot2docker/bootsync.sh >NUL
echo "Adding command to bootsync.sh: ifconfig eth1 $machine_ip netmask 255.255.255.0 broadcast $machine_base_ip.255 up"
echo "ifconfig eth1 $machine_ip netmask 255.255.255.0 broadcast $machine_base_ip.255 up" | docker-machine ssh $machine_name sudo tee -a /var/lib/boot2docker/bootsync.sh >NUL
# docker-machine ssh $machine "sudo cat /var/run/udhcpc.eth1.pid | xargs sudo kill"
# docker-machine ssh $machine "sudo ifconfig eth1 $machine_ip netmask 255.255.255.0 broadcast $machine_base_ip.255 up"

# Restart the Machine
docker-machine stop $machine_name
docker-machine start $machine_name

# Recreate certificates
docker-machine regenerate-certs $machine_name

echo "#############"
