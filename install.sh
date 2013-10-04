#! /bin/bash

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo apt-get update

rm -rf /etc/puppet
ln -s /opt/metasite/puppet /etc/puppet

puppet apply --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp

cd /opt/services/metasite-backend
/var/envs/metasite-backend/bin/python database.py db upgrade

/etc/init.d/metasite-backend restart
