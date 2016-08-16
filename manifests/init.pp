# Class: workstation
# ===========================
#
# This class automatically includes workstation specific 
# classes, based on operating system. Currently it supports
# both Arch Linux and Darwin (macOS). It is designed to 
# setup system shared applications, as well as setup the 
# default user account.
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
#     dotfiles_repo => 'https://github.com/blakejakopovic/dotfiles',
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
  $dotfiles_repo = false, # optional

) {

  if $default_user == 'root' {
    fail('default_user cannot be root user')
  }

  if $::osfamily == 'Archlinux' {
    class { 'workstation::arch':
      default_user => $default_user,
    }
  }

  if $::osfamily == 'Darwin' {
    class { 'workstation::darwin':
      default_user => $default_user,
    }
  }

  if $dotfiles_repo {
    class { 'workstation::dotfiles':
      default_user  => $default_user,
      dotfiles_repo => $dotfiles_repo,
    }
  }

  include workstation::pips
  include workstation::rubygems
}