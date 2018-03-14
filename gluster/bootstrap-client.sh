#!/usr/bin/env bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

yum -y install epel-release
yum -y install htop vim tree wget stress python2-pip python-devel gcc make git nginx pcre-devel

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

cd /vagrant

