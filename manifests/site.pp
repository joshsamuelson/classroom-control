node default {
  include users::admins
  $message = hiera('message')
  notify { $message: }

}
