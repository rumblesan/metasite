
class metasite::db {

  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ipv4acls                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
    postgres_password          => 'postgres!',
  }

  postgresql::server::db { 'metasite':
    user     => 'metasite',
    password => 'md56b2efe7dfa714d9cb6ee34e3def07c29'
  }

}
