#!/bin/bash
yum update -y
yum install -y wget

# download and install repo
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

yum update -y
yum install -y ansible

# configure ansible
echo “localhost ansible_connection=local” >> /etc/ansible/hosts

# init work directory
mkdir -p /home/ec2-user/work/ansible
cd /home/ec2-user/work/ansible
wget https://raw.githubusercontent.com/gkarthur/ansible/master/basics.yml
wget https://raw.githubusercontent.com/gkarthur/ansible/master/java.yml

cp -f *.yml /etc/ansible/roles/

# install basic tools
ansible-playbook /etc/ansible/roles/basics.yml

# install java jdk
ansible-playbook /etc/ansible/roles/java.yml
