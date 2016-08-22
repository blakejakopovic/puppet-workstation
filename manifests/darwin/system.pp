class workstation::darwin::system {

  $packages = [
    'binutils',
    'coreutils',
    'diffutils',
    'ed',
    'file-formula',
    'findutils',
    'gnu-indent',
    'gnu-sed',
    'gnu-tar',
    'gnu-which',
    'gnutls',
    'grep',
    'gzip',
    'less',
    'make',
    'openssh',
    'rsync', # homebrew/dupes
    'wget',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
    require  => Package['homebrew/dupes'],
  }
}