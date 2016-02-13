#!/bin/bash

echo Getting Programs (You will need to run as super user)

echo - Git
sudo apt-get install git

echo - Build Essentials
sudo apt-get install build-essential cmake python-dev

echo - NodeJS
sudo apt-get install nodejs npm
sudo npm install -g typescript

echo - Text Editors
sudo apt-get install vim


