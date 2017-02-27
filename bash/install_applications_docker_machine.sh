#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd "$(dirname "$0")"

echo "### Linux Environment Host Machine Application Setup ###"

echo ""
echo "- apt-get -"
apt-get update

echo ""
echo "- docker -" 
echo "Install packages to allow apt to use a repository over HTTPS:" 
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "Add Docker’s official GPG key:" 
curl -fsSL https://apt.dockerproject.org/gpg | apt-key add -
echo ""
echo "Use the following command to set up the stable repository." 
add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
echo ""
echo "Installation" 
apt-get update
apt-get -y install docker-engine
echo "Verify that docker is installed correctly by running the hello-world image." 
docker run hello-world

echo ""
echo "- Chryptography -"
apt-get -y install encfs

echo ""
echo "- Git -"
apt-get -y install git

echo ""
echo "- TMUX -"
apt-get -y install tmux
