node default {
  include users::admins
  $message = hiera('message')
  notify { $message: }
  include nginx
  nginx::vhost { 'testing1.puppetlabs.vm': }
}
