class users::admins {
  users::user { 'joe': }
  users::user { 'alice':
    group => 'staff',
  }
  users::user {'aaron':
    group => 'staff',
  }
  group {'staff':
    ensure => present,
  }
}
