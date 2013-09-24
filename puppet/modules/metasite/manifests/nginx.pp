
class metasite::nginx ($logdir) {

    package { 'nginx':
        ensure => present
    }

    file { '/etc/nginx/sites-available/metasite':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        require => Package['nginx'],
        content => template('metasite/nginx_conf.erb'),
        notify  => Service['nginx']
    }

    file { '/etc/nginx/sites-enabled/metasite':
        ensure  => 'link',
        target  => '/etc/nginx/sites-available/metasite',
        owner   => 'root',
        group   => 'root',
        require => Package['nginx']
    }

    file { '/etc/nginx/sites-enabled/default':
        ensure  => 'absent',
        require => Package['nginx']
    }

    service { 'nginx':
        ensure => running,
        path   => '/etc/init.d',
        require => [
            File[$logdir]
        ]
     }

}

