class workstation::arch::window_managers {

  $packages = [
    'compton',
    'dunst',
    'feh',
    'i3',
    'i3lock',
    'i3status',
    'lxappearance',
    'rofi',
    'xorg-server',
    'xorg-server-utils',
    'xorg-xinit',
  ]

  package { $packages:
    ensure => installed,
  }
}
