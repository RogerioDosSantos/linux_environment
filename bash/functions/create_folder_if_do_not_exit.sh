#!/bin/bash

FOLDER_PATH=$1

if [ -d  $FOLDER_PATH ] 
then
  echo Creating folder "$FOLDER_PATH"
  mkdir $FOLDER_PATH
else
  echo Folder "$FOLDER_PATH" already exist
fi

