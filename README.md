# Puppet Workstation

Automated workstation setup and configuration module for both Arch Linux, and macOS (Darwin) systems. It manages common system packages, Python pip packages, Rubygems, and installs user dotfiles.

This module was designed to support standalone puppet compilations, where no Puppet master is required. However, there is no reason why it can't also be used by a Puppet master to keep systems in check.

## NOTICE
This is an early release. It is **not yet production ready**.

## Setup

For macOS, this module requires installing the `homebrew` module
```
puppet module install thekevjames-homebrew
```

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

macOS requires the following to be installed:
* [Homebrew](http://brew.sh)
* Xcode Command Line Tools (`xcode-select --install`)

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
    dotfiles_repo => 'https://github.com/blakejakopovic/dotfiles',
  }
}
```

When using in standalone mode (without Puppet master)

```
git clone https://github.com/blakejakopovic/puppet-workstation
puppet-workstation
sudo puppet apply -e "class { 'workstation': default_user => 'blake' }"
```

Note: For an existing system, it's advisable to use the `--noop --verbose` flags, so you can review any changes that will occur.

## Limitations

The module currently only supports Arch Linux, and macOS (Darwin); however other operating systems may be added without significant issues. One consideration is that both Arch Linux and OS X have their own package managers (Pacman, and Homebrew respectively), so there may be some code duplication or puppet selector usage.

## Development

It's most likely that you will fork this repo, and customise it for your own needs. However, if you do find anything wrong, feel free to leave a github issue or submit a pull request.

## License
Copyright (c) 2016 Blake Jakopovic. Licensed under the Apache-2.0 license.