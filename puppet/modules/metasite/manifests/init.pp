
class metasite {

    include metasite::db

    $metasite_user  = 'meta'
    $metasite_group = 'meta'

    $www_root       = '/var/www'

    $metasite_www   = "${www_root}/metapiano"
    $metasite_logs  = '/var/log/metapiano'

    $metasite_host  = 'metapiano.com'

    class { 'metasite::nginx' :
        logdir => $metasite_logs
    }

    class { 'metasite::backend':
        username   => $metasite_user,
        groupname  => $metasite_group,
        logdir     => $metasite_logs,
        codefolder => '/opt/metasite'
    }

    userconfig { $metasite_user:
        username  => $metasite_user,
        uid       => 2001,
        groupname => $metasite_group,
        gid      => 3001
    }

    file { [ $www_root, $metasite_logs ]:
        ensure  => 'directory',
        owner   => $metasite_user,
        group   => $metasite_group,
        require => Userconfig[$metasite_user]
    }

    file { $metasite_www:
        ensure  => 'link',
        owner   => $metasite_user,
        group   => $metasite_group,
        target  => '/opt/metasite/html',
        require => [
            Userconfig[$metasite_user],
            File[$www_root]
        ]
    }

}

