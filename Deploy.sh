#!/bin/bash

#
# update apt sourcelist first
#
apt-get update

#
# define all pathnames
#
# version
# nodejs: 6.2.0
# docker: 1.11.2 Reference: https://docs.docker.com/engine/installation/binaries/
#
node_download_path="https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz"
node_package_name="node-v6.2.0-linux-x64.tar.xz"
node_home_path="node-v6.2.0-linux-x64"

docker_download_path="https://get.docker.com/builds/Linux/x86_64/docker-1.11.2.tgz"
docker_package_name="docker-1.11.2.tgz"
docker_home_path="docker"

system_run_path="/usr/local"

#
# install some essential packages for docker
#
apt-get -y install xz-utils git aufs-tools

#
# install avahi packages
#
apt-get -y install avahi-daemon avahi-utils

#
# create a new empty folder
#
cd /home
mkdir tmp
cd tmp

#
# install nodejs
#
wget $node_download_path
if [ $? != 0 ]
then
   echo "Download nodejs package failed!"
   exit 110
fi

tar Jxf $node_package_name
\cp -rf ./$node_home_path/* $system_run_path

#
# install docker
#
wget $docker_download_path
if [ $? != 0 ]
then
   echo "Download docker package failed!"
   exit 120
fi

tar zxf $docker_package_name
\cp -rf ./$docker_home_path/* $system_run_path/bin/

#
# cleanup
#
cd ..
rm -rf tmp

#
# add 'Restart=always' to /lib/systemd/system/avahi-daemon.service
#
IFS="
"

touch tmp.service

for i in `cat /lib/systemd/system/avahi-daemon.service`
do
  echo $i >> tmp.service
  if [ $i = "[Service]" ]
  then
    echo "Restart=always" >> tmp.service
  fi
done

mv tmp.service /lib/systemd/system/avahi-daemon.service
