class workstation::darwin::utilities {

  $casks = [
    'imageoptim',
    'sdformatter',
    'serial-tools',
    'unetbootin',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}