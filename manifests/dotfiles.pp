class workstation::dotfiles (

  $default_user,
  $dotfiles_repo,

) {

  case $::operatingsystem {
    'Darwin': {
      $home_path = "/Users/${default_user}"
      $dotfile_path = "${home_path}/.dotfiles"
    }
    default: {
      $home_path = "/home/${default_user}"
      $dotfile_path = "${home_path}/.dotfiles"
    }
  }

  exec { 'clone-dotfiles':
    command => "sudo -u ${default_user} git clone '${dotfiles_repo}' '${dotfile_path}'",
    path    => '/usr/bin:/bin',
    unless  => "test -d ${dotfile_path}",
    notify  => Exec['install-dotfiles'],
  }

  exec { 'install-dotfiles':
    command     => "${dotfile_path}/install",
    path        => '/usr/bin',
    user        => $default_user,
    refreshonly => true,
  }
}