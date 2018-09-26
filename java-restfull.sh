#!/bin/bash
yum update -y
yum install -y wget

# init work directory
mkdir -p /home/ec2-user/work/ansible
cd /home/ec2-user/work/ansible
wget https://raw.githubusercontent.com/gkarthur/ansible/master/basics.yml
wget https://raw.githubusercontent.com/gkarthur/ansible/master/java.yml
wget https://raw.githubusercontent.com/gkarthur/ansible/master/maven.yml

cp -f *.yml /etc/ansible/roles/

# access right
chown -R ec2-user:ec2-user /etc/ansible /home/ec2-user/work

# install basic tools
ansible-playbook /etc/ansible/roles/basics.yml --connection=local

# install java jdk
ansible-playbook /etc/ansible/roles/java.yml --connection=local

# install maven
ansible-playbook /etc/ansible/roles/maven.yml --connection=local
