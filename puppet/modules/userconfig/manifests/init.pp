
define userconfig ($username = $title, $uid, $groupname, $gid) {

    group { $groupname:
        ensure => present,
        name   => $groupname,
        gid    => $gid
    }

    user { $username:
        ensure     => present,
        uid        => $uid,
        gid        => $gid,
        managehome => true,
        home       => "/home/${username}/",
        shell      => "/bin/bash",
        groups     => ['sudo'],
        require    => Group[$groupname]
    }

    userconfig::dotfiles { $username:
        username  => $username,
        usergroup => $groupname
    }

}

