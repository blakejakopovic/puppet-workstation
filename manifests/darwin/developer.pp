class workstation::darwin::developer {

  $packages = [
    'cmake',
    'ctags',
    'git',
    'git-extras',
    'go',
    'hub',
    'mariadb',
    'memcached',
    'nginx',
    'perl',
    'postgresql',
    'python', # python2
    'python3',
    'redis',
    'ruby',
    'svn',
    'watch',
    'wdiff',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
  }

  $casks = [
    'arduino',
    'atom',
    'cyberduck',
    'dash',
    'docker',
    'github-desktop',
    'gitup',
    'iterm2',
    'lighttable',
    'pgadmin3',
    'psequel',
    'sqlitebrowser',
    'transmission',
    'transmit',
    'vagrant',
    'vagrant-manager',
    'virtualbox',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}