class workstation::arch (

  $default_user,

) {

  if $::operatingsystem != 'ArchLinux' {
    fail( "${::operatingsystem} is an unsupported operating system" )
  }

  class { 'workstation::arch::system':
    default_user => $default_user,
  }

  class { 'workstation::arch::web_browsers':
    default_user => $default_user,
  }

  include workstation::arch::developer
  include workstation::arch::filesystems
  include workstation::arch::fonts
  include workstation::arch::media
  include workstation::arch::monitoring
  include workstation::arch::networking
  include workstation::arch::social
  include workstation::arch::terminal
  include workstation::arch::window_managers
}