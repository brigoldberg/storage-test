#!/usr/bin/env bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

yum clean all
yum update yum
yum -y install epel-release
yum -y install htop vim tree wget

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

echo "storage-1     192.168.33.11" >> /etc/hosts     
echo "storage-2     192.168.33.12" >> /etc/hosts     

# Storage disk tasks
sfdisk /dev/sdb << EOF
;
EOF
mkfs.xfs -i size=512 /dev/sdb1
mkdir /data/brick1
echo '/dev/sdb1 /data/brick1 xfs defaults 1 2' >> /etc/fstab
mount -a && mount

# GlusterFS installation
yum -y install glusterfs-server
if [[ ${HOSTNAME} == "storage-1" ]]; then
    gluster peer probe storage-2
else
    gluster peer probe storage-1
fi

mkdir -p /data/brick1/gv0

gluster volume create gv0 replica 2 storage-1:/data/brick1/gv0 storage-2:/data/brick1/gv0
gluster volume start gv0
