#!/bin/bash
# Before running this script it is necessary to create a subfolder with running config files
# Task: this script to use output from  "show version"
echo "START DEVICE IOS VERSION  CHECK"
REQUIRED_IOS='16.9b'
VERSION_SEARCH_TEXT='version'
echo $REQUIRED_IOS

echo $(date +"%F")
echo $(date +"%T")
echo
for f in device_configs/* 
do 
  echo "BEGIN -- Processing file $f" 
  cat $f | grep hostname  
  IOS_VERSION=$(cat $f | grep $VERSION_SEARCH_TEXT | cut -d' ' -f2)
  echo Current IOS Version: $IOS_VERSION
  if [ $REQUIRED_IOS != $IOS_VERSION ] 
  then
    echo Upgrade ios version to: $REQUIRED_IOS
  else 
    echo No Upgrade needed
  fi
  cat $f | grep interface
  cat $f | grep ipv6
  echo "END -- Processing file $f"
  echo 
done
echo "END DEVICE IOS VERSION CHECK"
