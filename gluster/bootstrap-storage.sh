#!/usr/bin/env bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

yum clean all
yum update yum
yum -y install epel-release
yum -y install htop vim tree wget

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

cd /vagrant

