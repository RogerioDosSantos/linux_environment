#!/bin/bash

echo Creating and Mounting Temp
mkdir -p ~/temp
mount -t vboxsf Temp ~/temp

echo Mounting TFS
mkdir -p ~/tfs
mount -t vboxsf TFS ~/tfs

echo Mounting Safe
mkdir -p ~/.safe ~/safe
mount -t vboxsf Safe ~/.safe
encfs ~/.safe ~/safe
