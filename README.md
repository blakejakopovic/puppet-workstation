# Puppet Workstation

Automated workstation setup and configuration module for both Arch Linux, and macOS (Darwin) systems. Works best with hardware specific puppet modules (ie. macbook), and personal dotfiles.

This module was designed to support standalone puppet compilations, where no Puppet master is required. However, there is no reason why it can't also be used by a Puppet master to keep systems in check.

## NOTICE
This is an early release. It is **not yet production ready**.

### What workstation affects

This module includes configuration, packages, and services including:
* Developer Tools
* Filesystem Tools
* Media Utilities
* Monitoring Tools
* Networking Utilities
* Productivity 
* Social
* System
* Terminal
* General Utilities
* Web Browsers
* Window Managers (Arch Linux only)

### Setup Requirements

macOS requirements:
* $default_user must exist
* [Homebrew](http://brew.sh) (automatically installs Xcode Command Line Tools)
* Puppet Agent (`brew cask install puppet-agent`)
* Homebrew Puppet Module (`puppet module install thekevjames-homebrew`)
* An internet connection (or cached packages)

Arch Linux requirements:
* $default_user must exist
* Puppet Agent (`pacman -S puppet`)
* An internet connection (or cached packages)

### Beginning with workstation

Install the puppet workstation module

```
puppet module install blakejakopovic-workstation
```

## Usage

When using a Puppet server

```
node 'my.workstation.net' {
  class { 'workstation':
    default_user  => 'blake',
  }
}
```

When using in standalone mode (without Puppet master)

```
git clone https://github.com/blakejakopovic/puppet-workstation
cd puppet-workstation
sudo puppet apply -e "class { 'workstation': default_user => 'blake' }"
```

Note: For an existing system, it's advisable to use the `--noop --verbose` flags, so you can review any changes that may occur.

## Limitations

This module currently only supports Arch Linux, and macOS (Darwin); however other operating systems may be added without significant issues. One consideration is that both Arch Linux and OS X have their own package managers (Pacman, and Homebrew respectively), so there may be some code duplication and puppet selector statements required.

## Development

It's most likely that you will fork this repo, and customise it for your own needs. However, if you do find anything wrong, feel free to leave a github issue or submit a pull request.

## License
Copyright (c) 2016 Blake Jakopovic. Licensed under the Apache-2.0 license.
