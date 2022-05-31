#!/bin/bash -eux

echo "==> Applying updates"
apt-get update -y
#apt-get upgrade -y does not work with 22.04 LTS version

echo "==> Install required packages"
apt-get install git python3 python3-pip --yes
apt-get install software-properties-common --yes
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible --yes
apt purge cloud-init --yes
apt autoremove --yes

echo "==> Removing Cloud Init defaults"
rm -rf /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
rm -rf /etc/cloud/cloud.cfg.d/99-installer.cfg

# reboot
echo "==> Rebooting"
reboot
sleep 60