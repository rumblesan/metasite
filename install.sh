#! /bin/bash

ln -s /opt/metasite/puppet /etc/puppet
puppet apply --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp
