node default {
  notify { "Hello, my name is Josh": }
  include users
  include hosts
  include skeleton
  include motd
}
