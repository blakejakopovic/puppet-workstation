class workstation::darwin::media {

  $packages = [
    'ffmpeg',
    'imagemagick',
    'mplayer',
    'mpv',
    'youtube-dl',
  ]

  package { $packages:
    ensure   => installed,
    provider => brew,
  }

  $casks = [
    'audacity',
    'boom',
    'calibre',
    'get-lyrical',
    'handbrake',
    'mplayerx',
    'subtitles',
    'vlc',
  ]

  package { $casks:
    ensure   => installed,
    provider => brewcask,
  }
}