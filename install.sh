#! /bin/bash

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo apt-get update

ln -s /opt/metasite/puppet /etc/puppet

puppet apply --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp
