class workstation::arch::social {

  $packages = [
    'mutt',
    'irssi',
  ]

  package { $packages:
    ensure => installed,
  }
}
