class workstation::arch::developer {

  $packages = [
    'cmake',
    'ctags',
    'docker',
    'git',
    'hub',
    'java-runtime-common',
    'mariadb',
    'memcached',
    'nginx',
    'postgresql',
    'python',
    'python-pip',
    'python2',
    'python2-pip',
    'redis',
    'ruby',
    'sqlite',
    'vagrant',
    'virtualbox',
  ]

  package { $packages:
    ensure => installed,
  }
}
