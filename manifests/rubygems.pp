class workstation::rubygems {

  $gems = [
    'bundle',
    'pry',
    'rake',
    'awesome_print',
    'json',
  ]

  package { $gems:
    ensure   => installed,
    provider => gem,
  }
}
