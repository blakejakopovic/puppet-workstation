class workstation::darwin::productivity {

  $casks = [
    '1password',
    'alfred',
    'evernote',
    'istat-menus',
    'macdown',
    'parallels-desktop',
    'kaleidoscope',
    'graphviz',
    'google-earth-pro',
    'opencpn',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}