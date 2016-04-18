#!/bin/bash

echo Creating and Mounting Temp
mkdir -p ~/temp
sudo mount -t vboxsf Temp ~/temp

echo Creating and Mounting TFS
mkdir -p ~/tfs
sudo mount -t vboxsf TFS ~/tfs

echo Creating and Mounting Leel
mkdir -p ~/leel
sudo mount -t vboxsf Leel ~/leel

echo Creating and Mounting Safe
mkdir -p ~/.safe ~/safe
sudo mount -t vboxsf Safe ~/.safe
encfs ~/.safe ~/safe

