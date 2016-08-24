class workstation::darwin::utilities {

  $casks = [
    'betterzipql',
    'imageoptim',
    'qlcolorcode',
    'qlmarkdown',
    'qlprettypatch',
    'qlstephen',
    'qlvideo',
    'quicklook-csv',
    'quicklook-json',
    'sdformatter',
    'serial-tools',
    'suspicious-package',
    'unetbootin',
    'webpquicklook',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}
