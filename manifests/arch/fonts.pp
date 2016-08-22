class workstation::arch::fonts {

  $aur = [
    'ttf-font-awesome',
    'ttf-font-icons',
  ]

  package { $aur:
    ensure   => installed,
    provider => 'aur',
  }
}