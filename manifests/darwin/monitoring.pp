class workstation::darwin::monitoring {

  $packages = [
    'dnstop',
    'htop',
    'iftop',
    'lsof',
    'smartmontools',
    'sntop',
    'vnstat',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
  }
}