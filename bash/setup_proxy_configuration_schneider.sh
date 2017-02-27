
#!/bin/bash

# if [ "$EUID" -ne 0 ]
#   then echo "Please run as root"
#   exit
# fi

#Go to the current file folder
cd "$(dirname "$0")"

echo "### Setup Schneider Proxy Configuration ###"

echo ""
echo "- schneider proxy - "
export HTTP_PROXY=__http://gateway.zscaler.net:9480 
export HTTPS_PROXY=http://gateway.zscaler.net:9480 

