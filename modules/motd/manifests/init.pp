class motd {
  exec { "cowsay 'Welcome to ${::fqdn}!' > /etc/motd":
    path    => '/usr/bin:/usr/local/bin',
    creates => '/etc/motd',
  }
}
