#!/bin/bash

# TODO(Roger) - Implement error mechanism
# error() {
#   local parent_lineno="$1"
#   local message="$2"
#   local code="${3:-1}"
#   if [[ -n "$message"  ]] ; then
#     echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
#   else
#     echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
#   fi
#   exit "${code}"
# }
# trap 'error ${LINENO}' ERR
# set -e

GetLastProxyConfiguration()
{
  echo "http://gateway.zscaler.net:9480" 
}

ExitWithError()
{
  local func=$1
  local description=$2
  echo "Error: $func - $description"
  exit 1
}

ConfigureProxy()
{
  local proxy_url=
  local use_proxy="N"
  read -r -p "Are you using a WebProxy? [y/N] " use_proxy
  if [[ "$use_proxy" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    local current_proxy_url=$(GetLastProxyConfiguration)
    read -e -p "Please enter the Proxy URL: " -i "$current_proxy_url" proxy_url
    if [[  $current_proxy_url != $proxy_url  ]]
    then

      # TODO(Roger) - Exit if the Linux directory does not exist
      # if [[ ! -d "~/.linux" ]]
      # then
      #   error ${LINENO} "ConfigureProxy - You need the ~/.linux folder to change the proxy configuration" 2
      # fi

      # Replace the Proxy url on all files
      grep -rl "$current_proxy_url" ~/.linux | xargs sed -i "s|$current_proxy_url|$proxy_url|g"
    fi
  fi

  echo "$proxy_url"
}

