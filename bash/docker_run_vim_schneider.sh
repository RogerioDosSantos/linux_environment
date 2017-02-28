#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "### Start Vim machine from docker image ###"

docker run -it --name vim \
  -v ~/host:/root/host \
  -v ~/.linux:/root/.linux \
  -e HTTP_PROXY=http://gateway.zscaler.net:9480 \
  -e HTTPS_PROXY=http://gateway.zscaler.net:9480 \
  -e http_proxy=http://gateway.zscaler.net:9480 \
  -e https_proxy=http://gateway.zscaler.net:9480 \
  rogersantos/vim
