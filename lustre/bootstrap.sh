#!/usr/bin/env bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

yum -y install epel-release
yum -y install htop vim tree wget ansible

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

echo "192.168.33.11      storage-1" >> /etc/hosts
echo "192.168.33.12      storage-2" >> /etc/hosts

cat << EOF > /home/vagrant/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA6+B2BmFaLiwQb/kkTvNWPg/g5evPXBHNRx1g3ewkt4jF7sv3
y7CVr9huHNXAeOyIMM9/kngduqSvJqaMT/aTc1gfPGalb87ZjUWZA1cj94qkAFUI
gpVgBmVkDeoua++JEV8D902QFbs6kvWBx+5eS0yICOva0DCUnKYVmTvC7M43zhJK
RJn7833Ycxwmzn4+cDqzmsJBkcZmr/t1t2KvwUow+kxlb+kc0V37leqbHjG7w/LV
YYJEDRgPPybQSGcFRXg8b3WlPtO2HVW2eCy1te5NSlL/WlPC6eVxVgyai20yp5IY
ddogBr0j7HLgfFtAwi6UIB4yaVh3a0bDPjH8/QIDAQABAoIBAQCWmF6CQFGFPRjZ
hKWLyox7X0PlR6LCU5NOHhGkXooqq6ZDifIRGBLZjELxIf+atNlW4IPAjfPdIBu7
f4YB35nQgKigtaBWPChlq9O/cDlEaD3BAIlIZfpC2yUARU2SGALZFmK/18NwPHNv
NFPBxAxr4tbPa1XuqbWYNemARclzyhPI4ePDJx/D+x2I8/hClmVgEseiS+565bHM
gxclSJ3+6zgp6CVjJ2Q0NuuJkfHnXo6gLuXVRX+FPo48zh7kSM1CG2UIopQROclr
KNb5pa7oR9yLrAVMQ0RoKC0FwXY3V7lm9sarWQ68qFe5Vokf22OtgUSM6eIk9hoT
jMQjbdiBAoGBAPeozeNWgqAwtWufNwn9DMpxm7ulbw7xanP6UN6V5D4NdzTTe4r0
NMJIPVd7Iqe3+4sET3hTAz0TnyuxgKYmVdTkmzIRiduvXW+GBk+o6UARKHDx+lv3
LN/62L9LH+tD3GF7yU/VXwSfd07pPvxgK0D2RZKB/EPWqoNVv3giZBONAoGBAPPS
ErrqQXut3YYYfvFKGnbIGztsf78Cw5yNFayUQveGE5+yqj1F2MxDoSZ+bRXvVMgf
NUvHE2b9ZlEo3fPi2u9ifKWDbaYscfCpFpYvuEpTnZwbNYzbsLbiyPivOJ/n095b
l1zY0ccYea0DaLzaXTpqidrZ8SN0OKkAxSziG/sxAoGAGgGt7SuOeAflZTHI89GQ
4Elh0yiiKu2LAjbM+zK+Tw3W8MMsfAD88VHoryENGJOnZIfFWJtPAcDnvAzdt5Ta
+oovCejxkxItO6LVUtQn+kRS/NlMMxAXtEWBMUVQSsJLiCkZkLqVScT9IFo59QKc
SCwUTjg8J1uJeFUu0Ay8eZkCgYBR431M7758hoF/Nxzzdzr6J+0VgTRKd+gw3SWp
Z8YyEgLnQP9yQtI0kIZAQnfqxQ4JhInG4J7AmVzS51HcRpXXjpFkmYarKARAmtmu
KWrQ89JcirrqiyKH2hU7iMYQ1rDO3p4wndWe87ZyCFIWE5T6OKwCJ+6YRMF+6XZP
w8U4EQKBgQCFQDWjHDz2sSfvmUP2ipDar6eTeZnEptXe8jVAMNYSF/+yAWF0qSgS
ezuCN1gwrT4a/CLEsbgiJ7/rUIU9K9m1If0iOcjd4FZJSkVmidAiotStnWBPoKhP
OEppee5oN4Cz3OMaZCifh7wqWzrFsddX6sLGxad3lSNSi/fIY3AeyQ==
-----END RSA PRIVATE KEY-----
EOF

chmod 600 /home/vagrant/.ssh/id_rsa; chown vagrant:vagrant /home/vagrant/.ssh/id_rsa

cat << EOF > /home/vagrant/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr4HYGYVouLBBv+SRO81Y+D+Dl689cEc1HHWDd7CS3iMXuy/fLsJWv2G4c1cB47Igwz3+SeB26pK8mpoxP9pNzWB88ZqVvztmNRZkDVyP3iqQAVQiClWAGZWQN6i5r74kRXwP3TZAVuzqS9YHH7l5LTIgI69rQMJScphWZO8LszjfOEkpEmfvzfdhzHCbOfj5wOrOawkGRxmav+3W3Yq/BSjD6TGVv6RzRXfuV6pseMbvD8tVhgkQNGA8/JtBIZwVFeDxvdaU+07YdVbZ4LLW17k1KUv9aU8Lp5XFWDJqLbTKnkhh12iAGvSPscuB8W0DCLpQgHjJpWHdrRsM+Mfz9 vagrant@${HOSTNAME}
EOF

chmod 644 /home/vagrant/.ssh/id_rsa.pub; chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub

cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
