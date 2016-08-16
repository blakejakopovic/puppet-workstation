class workstation::arch::networking {

  $packages = [
    'aria2',
    'arm',
    'arp-scan',
    'avahi',
    'bind-tools',
    'hping',
    'iperf3',
    'knockd',
    'macchanger',
    'mosh',
    'mtr',
    'net-tools',
    'nmap',
    'openvpn',
    'speedtest-cli',
    'tor',
    'torsocks',
    'transmission-cli',
    'ufw',
    'wget',
  ]

  package { $packages:
    ensure => installed,
  }
}