class workstation::arch::terminal {

  $packages = [
    'bash-completion',
    'bc',
    'gawk',
    'psmisc',
    'pv',
    'pwgen',
    'ranger',
    'reptyr',
    'screen',
    'the_silver_searcher',
    'time',
    'tmux',
    'termite',
    'tree',
    'unrar',
    'unzip',
    'xz',
    'zsh',
    'zsh-syntax-highlighting',
  ]

  package { $packages:
    ensure => installed,
  }

  $aur = [
    'base16-git',
    'command-not-found',
  ]

  package { $aur:
    ensure => installed,
  }
}
