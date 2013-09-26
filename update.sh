#! /bin/bash

cd /opt/metasite
git pull

puppet apply --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp
