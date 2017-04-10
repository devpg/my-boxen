class people::devpg {

  ###
  # Packages via homebrew
  package { 'mas':
  }

  ###
  # Packages via cask
  $cask_packages = [
    'atom',
    'slack',
    'moom',
    'google-chrome',
    'skype',
    'vlc',
    'evernote',
    'whatsapp',
    'tweeten'
  ]
  package {
    $cask_packages:
    provider  => 'brewcask'
  }

  ###
  # Update existing packages
  exec {'Upgrade brew/ cask packages':
    command => "brew update",
    timeout => 1800,
    logoutput => 'on_failure'
  }

  ###
  # Upgrade all apps from Mac App Store
  exec {'Check Mac App Store for updates':
    command => "mas outdated",
    logoutput => true
  }
  exec {'Install updates':
    command => "mas upgrade",
    timeout => 1800,
    logoutput => 'on_failure'
  }
}
