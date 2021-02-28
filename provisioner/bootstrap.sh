#!/bin/bash -eux

echo "==> Applying updates"
apt-get update -y
apt-get upgrade -y

echo "==> Install required packages"
apt-get install git python3 python3-pip --yes
apt-get install software-properties-common --yes
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible --yes

# reboot
echo "==> Rebooting"
reboot
sleep 60