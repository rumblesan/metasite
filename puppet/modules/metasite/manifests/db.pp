
class metasite::db {

  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    listen_addresses           => '*',
    ipv4acls                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
    postgres_password          => 'postgres!',
  }

  postgresql::server::db { 'metasite':
    user     => 'metasite',
    password => postgresql_password('metasite', 'metasite')
  }

}
