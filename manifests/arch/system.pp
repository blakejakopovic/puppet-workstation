class workstation::arch::system {

  $packages = [
    'abs',
    'acpid',
    'arch-install-scripts',
    'coreutils',
    'expac',
    'nano',
    'openssh',
    'openssl',
    'pacmatic',
    'reflector',
    'vim',
  ]

  package { $packages:
    ensure => installed,
  }
}
