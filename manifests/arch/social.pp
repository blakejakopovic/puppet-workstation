class workstation::arch::social {

  $packages = [
    'mutt',
    'irssi',
  ]

  package { $packages:
    ensure => installed,
  }

  $aur = [
    'discord',
  ]

  package { $aur:
    ensure   => installed,
  }
}