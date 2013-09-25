
class metasite::backend( $username, $groupname, $logdir, $codefolder ) {

    include postgresql::lib::devel

    $metasite_backend_dir     = '/opt/services/metasite-backend'
    $metasite_backend_virtenv = '/var/envs/metasite-backend'
    $metasite_backend_port    = '8888'
    $gunicorn_logdir         = "${logdir}/gunicorn"

    file { [ $gunicorn_logdir, '/var/envs', $metasite_backend_virtenv
           , '/opt/services'
    ]:
        ensure => directory,
        owner  => $username,
        group  => $groupname
    }

    file { $metasite_backend_dir:
        ensure  => link,
        target  => "${codefolder}/backend",
        require => File['/opt/services']
    }

    class { 'python':
        version    => 'system',
        pip        => true,
        dev        => true,
        virtualenv => true
    }

    python::virtualenv { $metasite_backend_virtenv:
        ensure       => present,
        version      => 'system',
        owner        => $username,
        group        => $groupname,
        requirements => '/opt/services/metasite-backend/requirements.txt',
        require      => File['/opt/services/metasite-backend']
    }

    file { '/etc/init.d/metasite-backend':
        mode   => '0755',
        owner  => 'root',
        group  => 'root',
        content => template('metasite/backend/init_sh.erb')
    }

    service { 'metasite-backend':
        ensure     => running,
        hasrestart => true,
        path       => '/etc/init.d',
        require => [
            File['/etc/init.d/metasite-backend'],
            File[$gunicorn_logdir],
            Python::Virtualenv[$metasite_backend_virtenv]
        ]
    }

}

