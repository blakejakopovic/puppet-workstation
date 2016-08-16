class workstation::arch::media {

  $packages = [
    'ffmpeg',
    'imagemagick',
    'mpd',
    'mplayer',
    'mpv',
    'ncmpcpp',
    'youtube-dl',
  ]

  package { $packages:
    ensure => installed,
  }
}