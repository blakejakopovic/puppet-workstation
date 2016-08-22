class workstation::darwin (

  $default_user,

) {

  if $::operatingsystem != 'Darwin' {
    fail( "${::operatingsystem} is an unsupported operating system" )
  }

  class { '::homebrew':
    user    => $default_user,
    group   => 'admin',
  }

  package { 'homebrew/dupes':
    ensure   => present,
    provider => tap,
  }

  package { 'homebrew/boneyard':
    ensure   => present,
    provider => tap,
  }

  include workstation::darwin::developer
  include workstation::darwin::filesystems
  include workstation::darwin::media
  include workstation::darwin::monitoring
  include workstation::darwin::networking
  include workstation::darwin::productivity
  include workstation::darwin::social
  include workstation::darwin::system
  include workstation::darwin::terminal
  include workstation::darwin::utilities
  include workstation::darwin::web_browsers
}