class php {

  # package install list
  $packages = [
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5",
    "php-apc",
    "php5-curl",
    "php5-memcached",
    "php5-imap"
  ]

  package { 'php5':
    ensure => installed,
    require => Exec["apt-get update"]
  }

  package { $packages:
    ensure => installed,
    require => Package['php5']
  }

  file { '/etc/php5/apache2/php.ini':
     source => '/vagrant/files/php.ini',
     ensure => present,
     owner => 'root',
     group => 'root',
     require => Package['php5']
  }

  exec {'apt-get install php5-memcached':
    command => 'sudo /usr/bin/apt-get install php5-memcached',
    require => Package['php5']
  }
  exec {'apt-get install php5-imap':
    command => 'sudo /usr/bin/apt-get install php5-imap',
    require => Package['php5']
  }
  exec {'apt-get install php5-ldap':
    command => 'sudo /usr/bin/apt-get install php5-ldap',
    require => Package['php5']
  }

  exec {'apt-get install memcached':
    command => 'sudo /usr/bin/apt-get install memcached',
    require => Package['php5']
  }
  exec {'apt-get install memcache':
    command => 'sudo /usr/bin/apt-get install php5-memcache',
    require => Package['php5']
  }
}