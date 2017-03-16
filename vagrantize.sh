#!/bin/sh

set -x
set -e

# Install the virtualbox additions
mount -o loop VBoxGuestAdditions.iso /mnt/
cd /mnt
./VBoxLinuxAdditions.run
cd /
umount /mnt
# Set up the vagrant user and give him full access
groupadd vagrant
useradd -d /home/vagrant -s /bin/bash -g vagrant vagrant
echo "vagrant:vagrant" | chpasswd
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
su -c "umask 077 && mkdir /home/vagrant/.ssh && curl -O /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" vagrant
