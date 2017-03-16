#!/bin/bash

echo "### Docker Machine - Application Installer ###"

if [ "$EUID" -ne 0 ]; then 
  echo "This program must be run with administrator privileges.  Aborting"
  exit
fi

#Go to the current file folder
cd "$(dirname "$0")"
echo "- Running from $(pwd)"

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
apt-get -y install \
    docker-engine \
    python-pip \
    docker-compose
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
