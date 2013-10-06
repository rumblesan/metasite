#! /bin/sh

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update

ln -s /vagrant /opt/metasite

