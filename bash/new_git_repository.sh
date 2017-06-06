#!/usr/bin/env bash

# Copyright (c) 2015 LeeL Systems.
# This file is part of the XXX distribution (https://github.com/xxxx or http://xxx.github.io).

read -r -d '' var_help <<- EOM
### New git repository ###
Description: Create new git repository from the current folder.
Options:
  -h : Help
  -s : Run silently
  -l <local git project directory>
  -u <git repository url> 

EOM

# Exit on any non-zero status.
trap 'exit' ERR
set -E

function Log 
{
  var_message=$1
  if [ "$var_run_silently" != "true" ]; then
    echo "$var_message"
  fi
}

# Get the current directory and go to the directory where the bash file is
var_caller_dir="$(pwd)"
cd "$(dirname "$0")"

# Get Options
unset var_url
unset var_local_git_dir
while getopts h?sl:u: var_options
do
  case "${var_options}" in
    h) 
      Log "$var_help"
      exit 1
      ;;
    s)
      var_run_silently="true"
      ;;
    l)
      var_local_git_dir="${OPTARG}"
      ;;
    u) 
      var_url="${OPTARG}"
      ;;
  esac
done

if [ -z "$var_url" ]; then
  read -p "Please enter the repository URL: " var_url
fi

if [ -z "$var_local_git_dir" ]
then
  var_local_git_dir=$var_caller_dir
fi

Log "$0 configuration:"
Log "- Running from $(pwd)"
Log "- For help use -h"
Log "- Local git directory (-l): $var_local_git_dir"
Log "- Repository URL (-u): $var_url"

# Intialize Git Repository
cd $var_local_git_dir
git init
if [ ! -f "./.gitignore" ]; then
  echo "" > "./.gitignore"
fi

git add .
git commit -m "Initial commit"


