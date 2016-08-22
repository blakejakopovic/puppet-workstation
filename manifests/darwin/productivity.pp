class workstation::darwin::productivity {

  $casks = [
    '1password',
    'alfred',
    'evernote',
    'flux',
    'istat-menus',
    'keepingyouawake',
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