node default {
  include users::admins
  $message = hiera('message')
  notify { $message: }

  nginx::vhost { 'testing1.puppetlabs.vm': }
}
