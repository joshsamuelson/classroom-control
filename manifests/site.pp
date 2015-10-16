node default {
  notify { "Hello, my name is Josh": }
  include hosts
  include skeleton
  include motd
}
