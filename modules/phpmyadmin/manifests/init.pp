class phpmyadmin {
package { phpmyadmin:
    ensure => installed,
    require => Package['php5', 'mysql-server']
  }

  # Enable access via /phpmyadmin
  # This assumes apache is installed somewhere else in the Puppet manifests
  file { '/etc/apache2/sites-enabled/phpmyadmin':
    ensure  => 'present',
    content => 'include /etc/phpmyadmin/apache.conf',
    mode    =>  644,
    require => [
      Class['php'],
      Package['phpmyadmin']
    ]
  }

  # Remove config if it does not include auto-login options
  exec { 'remove-non-autologin-config':
    command => 'sudo rm /etc/phpmyadmin/config.inc.php',
    unless => 'grep "Enable auto-login" /etc/phpmyadmin/config.inc.php',
    path => ['/bin/', '/usr/bin/']
  }

  file { '/etc/phpmyadmin/config.inc.php':
     source => '/vagrant/files/config.inc.php',
     ensure => present,
     owner => 'root',
     group => 'root',
     require => Package['php5']
  }
}