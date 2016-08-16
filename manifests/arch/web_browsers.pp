class workstation::arch::web_browsers (

  $default_user,

) {

  $packages = [
    'firefox',
  ]

  package { $packages:
    ensure => installed,
  }

  $aur = [
    'profile-sync-daemon',
  ]

  package { $aur:
    ensure => installed,
  }

  file { 'psd-config':
    name    => "/home/${default_user}/config/psd/psd.conf",
    source  => 'puppet:///modules/workstation/arch/psd.conf',
    require => Package['profile-sync-daemon'],
    notify  => Exec['psd-service'],
  }

  exec { 'psd-service':
    command     => 'systemctl enable --user --now psd',
    path        => '/usr/bin',
    refreshonly => true,
  }
}