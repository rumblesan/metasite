
define userconfig::dotfiles( $username = $title, $usergroup ) {

    $home_dir = "/home/${username}"
    $ssh_dir  = "${home_dir}/.ssh"

    file { "${ssh_dir}":
        ensure  => directory,
        owner   => $username,
        group   => $usergroup,
        require => User[$username]
    }
    file { "${ssh_dir}/config":
        mode    => '0600',
        owner   => $username,
        group   => $usergroup,
        source  => 'puppet:///modules/userconfig/sshconfig',
        require => File[$ssh_dir]
    }
    file { "${home_dir}/.bash_profile":
        mode    => '0644',
        owner   => $username,
        group   => $usergroup,
        source  => 'puppet:///modules/userconfig/bash_profile',
        require => User[$username]
    }
    file { "${home_dir}/.bashrc":
        mode    => '0644',
        owner   => $username,
        group   => $usergroup,
        source  => 'puppet:///modules/userconfig/bashrc',
        require => User[$username]
    }

}

