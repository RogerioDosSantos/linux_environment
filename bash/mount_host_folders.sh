#!/bin/bash

echo Creating and Mounting Host
mkdir -p ~/host
sudo mount -t vboxsf Host ~/host

echo Creating and Mounting Safe
mkdir -p ~/.safe ~/safe
sudo mount -t vboxsf Safe ~/.safe
encfs ~/.safe ~/safe

