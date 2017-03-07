#!/bin/bash

echo "### Docker Machine - Links Setup ###"

# Ensure that run as root
if [ "$EUID" -ne 0 ]
  then echo "This program must be run with administrator privileges. Aborting..."
  exit
fi

# Go to the directory where the bash file is
cd "$(dirname "$0")"
echo "Running from: $(pwd)"

echo - Linux Environment -

echo - Environment folder
rm -f ~/.linux
ln -s -n ~/git/linux_environment ~/.linux

echo - /etc/rc.local
rm -f /etc/rc.local
ln -s -n ~/.linux/linux/etc_rc.local_docker_machine /etc/rc.local

echo - /etc/environment
rm -f /etc/environment
read -r -p "Would you like add proxy configuration? [y/N] " use_proxy
if [[ "$use_proxy" =~ ^([yY][eE][sS]|[yY])+$ ]]
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
if [[ "$use_proxy" =~ ^([yY][eE][sS]|[yY])+$ ]]
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
