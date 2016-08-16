class workstation::pips {

  # Installs using Python 3 pip
  $pips = [
    'flask',
    'obfsproxy',
    'pygments',
  ]

  $pip_require = $::osfamily ? {
    'Archlinux' => Package['python-pip'],
    'Darwin'    => Package['python3'],
    default     => undef,
  }

  package { $pips:
    ensure   => present,
    provider => pip,
    require  => $pip_require,
  }
}
