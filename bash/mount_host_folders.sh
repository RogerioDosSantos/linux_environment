#!/bin/bash

echo Creating and Mounting Temp
mkdir -p ~/temp
mount -t vboxsf Temp ~/temp

echo Creating and Mounting TFS
mkdir -p ~/tfs
mount -t vboxsf TFS ~/tfs

echo Creating and Mounting Safe
mkdir -p ~/.safe ~/safe
mount -t vboxsf Safe ~/.safe
encfs ~/.safe ~/safe

echo Creating and Mounting Leel
mkdir -p ~/.leel ~/leel
mount -t vboxsf Leel ~/.leel
encfs ~/.leel ~/leel

