#!/bin/bash

echo Unmounting Temp
sudo fusermount -u ~/temp

echo Unmounting TFS
sudo fusermount -u ~/tfs

echo Unmounting Safe
sudo fusermount -u ~/safe

echo Unmounting Leel
sudo fusermount -u ~/leel

