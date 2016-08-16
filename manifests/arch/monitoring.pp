class workstation::arch::monitoring {

  $packages = [
    'htop',
    'iftop',
    'iotop',
    'lsof',
    'ncdu',
    'ntop',
    'smartmontools',
    'vnstat',
  ]

  package { $packages:
    ensure => installed,
  }
}