#!/bin/bash

echo Unmounting Temp
fusermount -u ~/temp

echo Unmounting TFS
fusermount -u ~/tfs

echo Unmounting Safe
fusermount -u ~/safe
fusermount -u ~/.safe

