class workstation::arch::fonts {

  $aur = [
    # Iconic fonts
    'ttf-font-awesome',
    'ttf-font-icons',
  ]

  package { $aur:
    ensure => installed,
  }
}