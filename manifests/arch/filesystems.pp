class workstation::arch::filesystems {

  $packages = [
    'cifs-utils',
    'ddrescue',
    'dosfstools',
    'hfsprogs',
    'rsync',
    'samba',
    'sshfs',
  ]

  package { $packages:
    ensure => installed,
  }
}