#!/bin/bash

#
# Platform: Ubuntu 16.04 server 64bit
#

#
# Operation Path: chroot /target
#

#
# update apt sourcelist first
#
echo "deb http://ubuntu.uestc.edu.cn/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list
echo "deb http://ubuntu.uestc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ubuntu.uestc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ubuntu.uestc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ubuntu.uestc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list

apt-get update

#
# define all pathnames
#
# version
# nodejs: 6.2.2
#
node_download_path="https://nodejs.org/dist/v6.2.2/node-v6.2.2-linux-x64.tar.xz"
node_package_name="node-v6.2.2-linux-x64.tar.xz"
node_home_path="node-v6.2.2-linux-x64"

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
mkdir -p /home/tmp
cd /home/tmp

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
apt-get update
apt-get -y install apt-transport-https ca-certificates
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 F76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get -y install linux-image-extra-$(uname -r) apparmor
apt-get -y install docker-engine

#
# cleanup
#
cd ..
rm -rf tmp

systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl disable docker
