#!/bin/bash

echo Creating and Mounting Safe
mkdir -p ~/.safe ~/safe
sudo mount -t vboxsf Safe ~/.safe
encfs ~/.safe ~/safe
