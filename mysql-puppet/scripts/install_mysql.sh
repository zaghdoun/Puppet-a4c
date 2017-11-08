#!/bin/bash
sudo -s
#install agent puppet 
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get install puppet
sudo apt-get install puppet-common -y
sudo apt-get install unzip -y


# delete directory puppet 
sudo rm -r /etc/puppet 

# config directory puppet 
mkdir /home/ubuntu/puppet
sudo mv $puppet_file /home/ubuntu/puppet
cd /home/ubuntu/puppet
unzip recipe.puppet
sudo rm recipe.puppet
sudo chown -R root:root /home/ubuntu/puppet

# mv recipe puppet to /etc

sudo mv /home/ubuntu/puppet /etc

cd /etc/puppet/manifests

sudo -E puppet apply create.pp

