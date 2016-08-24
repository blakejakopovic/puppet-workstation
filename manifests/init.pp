# Class: workstation
# ===========================
#
# This class automatically includes workstation specific 
# classes, based on operating system. Currently it supports
# both Arch Linux and Darwin (macOS). It is designed to 
# setup system shared packages and applications.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `default_user`
# Specify default user for the workstation (not root)
#
# Examples
# --------
#
# @example
#   class { 'workstation':
#     default_user  => 'blake',
#   }
#
# Authors
# -------
#
# Blake Jakopovic <blake.jakopovic@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Blake Jakopovic, unless otherwise noted.
#

class workstation (

  $default_user,

) {

  if $default_user == 'root' {
    fail('default_user cannot be root user')
  }

  if $::osfamily == 'Archlinux' {
    include workstation::arch
    include workstation::pips
    include workstation::rubygems
  }
  elsif $::osfamily == 'Darwin' {
    class { 'workstation::darwin':
      default_user => $default_user,
    }
    include workstation::pips
    include workstation::rubygems
  }
  else {
    fail( "${::operatingsystem} is an unsupported operating system" )
  }
}
