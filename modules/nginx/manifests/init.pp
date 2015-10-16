class nginx {
# Windows owner/group: Administrator / Administrators
File {
owner => 'root',
group => 'root',
mode => '0664',
}
# Windows package name: nginx-service
package { 'nginx':
ensure => present,
}
# Windows path: C:/ProgramData/nginx/html
file { '/var/www':
ensure => directory,
}
# Windows path: C:/ProgramData/nginx/html/index.html
file { '/var/www/index.html':
ensure => file,
source => 'puppet:///modules/nginx/index.html',
}
# Windows path: C:/ProgramData/nginx/conf/nginx.conf
file { '/etc/nginx/nginx.conf':
ensure => file,
source => 'puppet:///modules/nginx/nginx.conf',
require => Package['nginx'],
notify => Service['nginx'],
}
# Windows path: C:/ProgramData/nginx/conf.d/default.conf
file { '/etc/nginx/conf.d/default.conf':
ensure => file,
source => 'puppet:///modules/nginx/default.conf',
notify => Service['nginx'],
require => Package['nginx'],
}
service { 'nginx':
ensure => running,
enable => true,
}}
