
node 'metapiano.com' {

    include metasite

    package { 'curl':
        ensure => present
    }

}

