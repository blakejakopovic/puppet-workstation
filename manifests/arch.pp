class workstation::arch {

  if $::operatingsystem != 'ArchLinux' {
    fail( "${::operatingsystem} is an unsupported operating system" )
  }

  include workstation::arch::developer
  include workstation::arch::filesystems
  include workstation::arch::fonts
  include workstation::arch::media
  include workstation::arch::monitoring
  include workstation::arch::networking
  include workstation::arch::social
  include workstation::arch::system
  include workstation::arch::terminal
  include workstation::arch::web_browsers
  include workstation::arch::window_managers
}