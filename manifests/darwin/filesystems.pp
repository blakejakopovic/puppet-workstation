class workstation::darwin::filesystems {

  $packages = [
    'ddrescue',
    'dosfstools',
    'samba', # homebrew/boneyard
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
    require  => Package['homebrew/boneyard'],
  }
}