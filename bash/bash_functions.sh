#!/bin/bash

GetProxyName()
{
  local use_proxy="N"
  read -r -p "Are you using a WebProxy? [y/N] " use_proxy
  if [[ "$use_proxy" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    local proxy_url=""
    read -e -p "Please enter the Proxy URL: " -i "http://gateway.zscaler.net:9480" proxy_url
  fi

  echo "$proxy_url"
}


