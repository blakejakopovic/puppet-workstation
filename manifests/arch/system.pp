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

  $aur = [
    'arch-wiki-docs',
    'arch-wiki-lite',
  ]

  package { $aur:
    ensure   => installed,
    provider => aurget,
  }
}