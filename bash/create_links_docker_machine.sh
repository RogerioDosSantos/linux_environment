#!/bin/bash

echo "### Docker Machine - Links Setup ###"


# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges. Aborting..."
  exit
fi

# Load functions
. ~/.linux/bash/bash_functions.sh

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from: $(pwd)"

echo - Linux Environment -

echo - Environment folder
rm -f ~/.linux
ln -s -n ~/git/linux_environment ~/.linux

echo - Proxy Configuration
proxy_url=$(ConfigureProxy)
if [[ $proxy_url != "" ]]
then
  echo "Proxy $proxy_url configured."
else
  echo "No Proxy configured."
fi

echo - /etc/rc.local
rm -f /etc/rc.local
ln -s -n ~/.linux/linux/etc_rc.local_docker_machine /etc/rc.local

echo - /etc/environment
rm -f /etc/environment
if [[ $proxy_url != "" ]]
then
  ln -s -n ~/.linux/linux/etc_environment_proxy_docker_machine /etc/environment
else
  ln -s -n ~/.linux/linux/etc_environment_docker_machine /etc/environment
fi

echo - /etc/systemd/system/docker.service.d
if [ ! -d "/etc/systemd/system/docker.service.d"  ]; then
  mkdir /etc/systemd/system/docker.service.d
fi

echo - /etc/systemd/system/docker.service.d/docker.conf
rm -f /etc/systemd/system/docker.service.d/docker.conf
ln -s -n ~/.linux/docker/etc_systemd_system_docker.service.d_docker.conf /etc/systemd/system/docker.service.d/docker.conf

echo - /etc/systemd/system/docker.service.d/http-proxy.conf
if [[ $proxy_url != "" ]]
then
  rm -f /etc/systemd/system/docker.service.d/http-proxy.conf
  ln -s -n ~/.linux/docker/etc_systemd_system_docker.service.d_http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
fi

echo - dot files / folders
rm -f ~/.tmux.conf
ln -s -n ~/.linux/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.gitconfig
ln -s -n ~/.linux/git/gitconfig ~/.gitconfig

echo - Shortcuts
rm -f ~/bash
ln -s -n ~/.linux/bash ~/bash
rm -f ~/docker
ln -s -n ~/host/git/docker ~/docker

echo "#############"
