#!/bin/bash
yum update -y

# download and install repo
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

yum update -y
yum install -y ansible

# configure ansible
echo “localhost ansible_connection=local” >> /etc/ansible/hosts

# Install Git to get ansible scriptq
yum install -y git

mkdir /home/ec2-user/work
cd /home/ec2-user/work
git clone https://github.com/gkarthur/ansible.git
cp ansible/*.yml /etc/ansible/roles/

# install tools
ansible-playbook /etc/ansible/roles/basics.yml
ansible-playbook /etc/ansible/roles/java.yml
