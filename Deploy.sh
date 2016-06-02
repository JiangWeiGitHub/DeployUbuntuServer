#!/bin/bash

#
# define all pathnames
#
# version
# nodejs: 6.2.0
# docker: 1.11.2 Reference: https://docs.docker.com/engine/installation/binaries/
var nodepath="https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz"
var dockerpath="https://get.docker.com/builds/Linux/x86_64/docker-1.11.2.tgz"

#
# install some essential packages
#
apt-get update
apt-get install xz-utils git

#
# create a new empty folder
#
cd /home
mkdir tmp
cd tmp

#
# install nodejs
#
wget $nodepath
if [ $? != 0 ]
then
   echo "Download nodejs package failed!"
   exit 110
fi

systemctl stop docker

nano /lib/systemd/system/avahi-daemon.service
Restart=always



```
