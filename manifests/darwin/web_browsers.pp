class workstation::darwin::web_browsers {

  $casks = [
    'firefox',
    'google-chrome',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}