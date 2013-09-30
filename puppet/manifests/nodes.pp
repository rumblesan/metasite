
node /^app[0-9]+\.metapiano\.com$/ {

    include metasite

    package { 'curl':
        ensure => present
    }

    package { 'icecast2':
        ensure => present
    }

}

