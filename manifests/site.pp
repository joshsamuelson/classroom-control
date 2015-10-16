node default {
  notify { "Hello, my name is Josh": }
  include hosts
  include skeleton
  include motd
  include nginx
  if $::virtual != 'physical' {
$vmname = capitalize($::virtual)
notify { "This is a ${vmname} virtual machine.": }
}
}
