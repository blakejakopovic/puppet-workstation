class workstation::darwin::networking {

  $casks = [
    'namebench',
    'tripmode',
    'tunnelblick',
    'wireshark',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}