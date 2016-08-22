class workstation::arch::web_browsers {

  $packages = [
    'firefox',
  ]

  package { $packages:
    ensure => installed,
  }
}