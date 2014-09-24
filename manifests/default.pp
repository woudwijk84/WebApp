# default path
Exec {
	path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "usr/local/bin", "/usr/local/sbin"]
}

#exec { 'composer-run':
#    command => "expect -c '
#    set timeout -1
#    spawn /usr/local/bin/composer.phar install --dev
#    expect {
#        -re {Username: } {
#            send \"${::composer_user}r\"
#            exp_continue
#        }
#        -re { Password: }{
#            send \"${::composer_pass}r\"
#            exp_continue
#        }
#        -re {^Generating autoload files }
#    }'",
#    cwd     => '/vagrant/',
#    user    => root,
#    group   => root,
#    timeout => 0,
#    require => [Package['git'], Package['expect'], Package['php5-cli'], File['composer.phar']]
#}

include bootstrap
#include tools
include apache
include php
include php::pear
include php::pecl
include mysql
include phpmyadmin
include composer