class workstation::darwin::terminal {

  package { 'macvim':
    ensure          => installed,
    provider        => brewcask,
    install_options => '--override-system-vim --custom-system-icons',
  }

  package { 'vim':
    ensure          => installed,
    provider        => brew,
    install_options => '--override-system-vi',
  }

  $packages = [
    'bash',
    'emacs',
    'gawk',
    'nano', # homebrew/dupes
    'pv',
    'screen',
    'tmux',
    'tree',
    'unrar',
    'unzip',
    'zsh',
    'zsh-syntax-highlighting',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
    require  => Package['homebrew/dupes'],
  }
}