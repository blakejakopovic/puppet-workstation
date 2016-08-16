class workstation::arch::system (

  $default_user,

) {

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
    'downgrade',
  ]

  package { $aur:
    ensure => installed,
  }

  # https://wiki.archlinux.org/index.php/SSH_keys
  file { 'ssh-agent-service':
    name    => "/home/${default_user}/.config/systemd/user/ssh-agent.service",
    content => 'puppet:///modules/workstation/arch/ssh-agent.service',
    owner   => $default_user,
    group   => $default_user,
    require => Package['openssh'],
    notify  => Exec['ssh-agent-user-service'],
  }

  exec { 'ssh-agent-user-service':
    command     => 'systemctl enable --now ssh-agent',
    path        => '/usr/bin',
    user        => $default_user,
    refreshonly => true,
  }
}