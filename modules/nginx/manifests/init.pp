class nginx (
$package = $nginx::params::package,
$owner = $nginx::params::owner,
$group = $nginx::params::group,
$docroot = $nginx::params::docroot,
$confdir = $nginx::params::confdir,
$logdir = $nginx::params::logdir,
$user = $nginx::params::user,
) inherits nginx::params {
File {
owner => $owner,
group => $group,
mode => '0664',
}
package { $package:
ensure => present,
}
nginx::vhost { 'default':
docroot => $docroot,
servername => $::fqdn,
}
file { "${docroot}/vhosts":
ensure => directory,
}
file { "${confdir}/nginx.conf":
ensure => file,
content => template('nginx/nginx.conf.erb'),
notify => Service['nginx'],
}
service { 'nginx':
ensure => running,
enable => true,
}
}
