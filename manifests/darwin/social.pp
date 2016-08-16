class workstation::darwin::social {

  $packages = [
    'irssi',
    'mutt',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
  }

  $casks = [
    'discord',
    'colloquy',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}