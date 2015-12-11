class people::danjenkins {

  homebrew::tap { 'caskroom/versions': }

  #fonts
  homebrew::tap { 'caskroom/fonts': }
  ->
  package { ['font-anonymous-pro',
             'font-dejavu-sans',
             'font-dejavu-sans-mono-for-powerline',
             'font-inconsolata-dz-for-powerline',
             'font-inconsolata-for-powerline',
             'font-noto-sans',
             'font-noto-sans-s-chinese',
             'font-noto-sans-t-chinese',
             'font-noto-sans-japanese',
             'font-noto-sans-korean',
             'font-noto-serif',
             'font-roboto',
             'font-sauce-code-powerline',
             'font-source-code-pro',
             'font-source-sans-pro',
             'font-source-serif-pro',
             'font-terminus',
             'font-ubuntu-mono-powerline']:
    provider => 'brewcask'
  }

  package { ['firefox',
             'multifirefox',
             'firefoxdeveloperedition',
             'firefox-nightly',
             'firefox-beta',
             'opera',
             'vivaldi',
             'google-chrome',
             'google-chrome-canary']:
    provider => 'brewcask',
    install_options => ['--appdir=/Applications', '--force'],
  }

  package { ['macdown',
             'gitbook',
             'skitch',
             'paparazzi',
             'sequel-pro',
             'dash',
             'gifs']:
    provider => 'brewcask',
    install_options => ['--appdir=/Applications', '--force'],
  }

  package { ['x-lite',
             'slack',
             'adium',
             'skype',
             'messenger',
             'unofficialwhatsapp']:
    provider => 'brewcask',
    install_options => ['--appdir=/Applications', '--force'],
  }

  include iterm2::dev
  include zsh
  include ohmyzsh
  #include python

  include dockutil

  package { ['alfred',
             'spectacle',
             'evernote',
             'android-file-transfer',
             'doxie',
             'drobo-dashboard',
             'dropbox',
             'box-sync',
             'caffeine',
             'fitbit-connect',
             'flux',
             'handbrake',
             'music-manager',
             'recordit',
             'screenhero',
             'steam',
             'the-unarchiver',
             'wireshark',
             'dockertoolbox',
             'hocus-focus',
             'tunnelbear']:
    provider => 'brewcask',
    install_options => ['--appdir=/Applications', '--force'],
  }

  package { ['vlc',
             'radiant-player',
             # 'soundcast'
            ]:
    provider => 'brewcask',
    install_options => ['--appdir=/Applications', '--force'],
  }


  include sublime_text

  # Homebrew Package
  package { 'mackup':
    ensure => installed,
  }

  package { 'cloc':
    ensure => installed,
  }

  package { 'ngrok':
    ensure => installed
  }

  package { 'speedtest_cli':
    ensure => installed
  }

  package { 'youtube-dl':
    ensure => installed
  }

  package { 'highlight':
    ensure => installed
  }

  appstore::app { '1Password':
    source => '1password-password-manager/id443987910',
  }

  appstore::app { 'Memory-Clean':
    source => 'memory-clean-monitor-free/id451444120',
  }

  appstore::app { 'Textual5':
    source => 'textual-5/id896450579',
  }

  appstore::app { 'Pocket':
    source => 'pocket/id568494494',
  }

  appstore::app { 'Toolbox-For-Keynote':
    source => 'toolbox-for-keynote/id582635628',
  }

  appstore::app { 'Tweetbot':
    source => 'tweetbot-for-twitter/id557168941', # required
  }

   appstore::app { 'Sunrise':
    source => 'sunrise-calendar/id886106985', # required
  }

  appstore::app { 'Keynote':
    source => 'keynote/id409183694'
  }

  appstore::app { 'Pages':
    source => 'pages/id409201541'
  }

  appstore::app { 'Numbers':
    source => 'numbers/id409203825'
  }

  # Sane Defaults
  Boxen::Osx_defaults {
    user => $::boxen_user,
  }

  $env = {
    directories => {
      home      => '/Users/$::boxen_user',
      dotfiles  => '/Users/$::boxen_user/.dotfiles'
    },
    dotfiles => [

    ],
    packages => {
      brew   => [
        'wget',
        'gpg2',
        'tmux'
      ]
    }
  }

  # OSX Defaults
  # Taken from https://gist.github.com/jfryman/4963514
  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Disable press-and-hold character picker':
    key    => 'ApplePressAndHoldEnabled',
    domain => 'NSGlobalDomain',
    value  => 'false',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Secure Empty Trash':
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Do not create .DS_Store On the Network':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'key repeat rate':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => '0',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'initial key repeat delay':
    domain => 'NSGlobalDomain',
    key    => 'InitialKeyRepeat',
    value  => '0',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Expand save panel by default':
    key    => 'NSNavPanelExpandedStateForSaveMode',
    domain => 'NSGlobalDomain',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Expand print panel by default':
    key    => 'PMPrintingExpandedStateForPrint',
    domain => 'NSGlobalDomain',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Minimize on Double-Click':
    key    => 'AppleMiniaturizeOnDoubleClick',
    domain => 'NSGlobalDomain',
    value  => 'true',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Put my Dock on the bottom':
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => 'bottom',
    user   => "${::boxen_user}",
  }

  boxen::osx_defaults { 'Always open Finder windows in list view mode':
    key    => 'FXPreferredViewStyle',
    domain => 'com.apple.finder',
    value  => 'Nlsv',
    user   => "${::boxen_user}",
  }
  boxen::osx_defaults { 'Disable the warning before emptying the Trash':
    key    => 'WarnOnEmptyTrash',
    domain => 'com.apple.finder',
    value  => 'false',
    user   => "${::boxen_user}",
  }

  boxen::osx_defaults { 'Quit the printer app once printing is complete':
    key => 'Quit When Finished',
    domain => 'com.apple.print.PrintingPrefs',
    value => true,
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Stop smart quotes':
    key => 'NSAutomaticQuoteSubstitutionEnabled',
    domain => 'NSGlobalDomain',
    value => false,
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Stop smart dashes':
    key => 'NSAutomaticDashSubstitutionEnabled',
    domain => 'NSGlobalDomain',
    value => false,
    user => "${::boxen_user}"
  }

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  include osx::dock::dim_hidden_apps

  include osx::safari::enable_developer_mode

  include osx::disable_app_quarantine

  include osx::finder::show_hidden_files

  boxen::osx_defaults { 'Enable Network Time Machine':
    key => 'TMShowUnsupportedNetworkVolumes',
    domain => 'com.apple.systempreferences',
    value => '1',
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Dark Theme':
    key => 'AppleInterfaceStyle',
    domain => 'NSGlobalDomain',
    value => 'Dark',
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Disable Guest Access':
    key => 'GuestEnabled',
    domain => 'com.apple.loginwindow',
    value => 'NO',
    user => "root"
  }

  boxen::osx_defaults { 'Enable System Info on Login Window':
    key => 'AdminHostInfo',
    domain => 'com.apple.loginwindow',
    value => 'HostName',
    user => "root"
  }

  boxen::osx_defaults { 'Remove the Date andtime from Screenshots':
    key => 'include-date',
    domain => 'com.apple.screencapture',
    value => false,
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Enable a path to be default file view':
    key => 'NewWindowTarget',
    domain => 'com.apple.finder',
    value => 'PfDe',
    user => "${::boxen_user}"
  }

  boxen::osx_defaults { 'Set the Desktop to be default file view':
    key => 'NewWindowTargetPath',
    domain => 'com.apple.finder',
    value => "file:///Users/$::boxen_user/Desktop/",
    user => "${::boxen_user}"
  }

  osx_login_item { 'Dropbox':
    name => 'Dropbox',
    path => '/Applications/Dropbox.app',
    hidden => true
  }

  osx_login_item { 'Alfred 2':
    name => 'Alfred 2',
    path => '/Applications/Alfred 2.app',
    hidden => true,
  }

  osx_login_item { 'Flux':
    name => 'Flux',
    path => '/Applications/Flux.app',
    hidden => true,
  }

  osx_login_item { 'Box Sync':
    name => 'Box Sync',
    path => '/Applications/Box Sync.app',
    hidden => true,
  }

  osx_login_item { 'Caffeine':
    name => 'Caffeine',
    path => '/Applications/Caffeine.app',
    hidden => true,
  }

  osx_login_item { 'Hocus Focus':
    name => 'Hocus Focus',
    path => '/Applications/Hocus Focus.app',
    hidden => false,
  }

  osx_login_item { 'Spectacle':
    name => 'Spectacle',
    path => '/Applications/Spectacle.app',
    hidden => true,
  }

  osx_login_item { 'Memory Clean':
    name => 'Memory Clean',
    path => '/Applications/Memory Clean.app',
    hidden => true,
  }

  # soundcast isn't in the cask repo yet as I was the one that created it
  # osx_login_item { 'soundcast':
  #   name => 'soundcast',
  #   path => '/Applications/soundcast.app',
  #   hidden => false,
  # }

  # Dockutil

  dockutil::item { 'Remove Photo Booth':
    label  => 'Photo Booth',
    item   => 'Photo Booth',
    action => 'remove',
  }

  dockutil::item { 'Remove Mail':
    label  => 'Mail',
    item   => 'Mail',
    action => 'remove',
  }

  dockutil::item { 'Remove Mission Control':
    label  => 'Mission Control',
    item   => 'Mission Control',
    action => 'remove',
  }

  dockutil::item { 'Remove Launchpad':
    label  => 'Launchpad',
    item   => 'Launchpad',
    action => 'remove',
  }

  dockutil::item { 'Remove Reminders':
    label  => 'Reminders',
    item   => 'Reminders',
    action => 'remove',
  }

  dockutil::item { 'Remove Maps':
    label  => 'Maps',
    item   => 'Maps',
    action => 'remove',
  }

  dockutil::item { 'Remove Photos':
    label  => 'Photos',
    item   => 'Photos',
    action => 'remove',
  }

  dockutil::item { 'Remove FaceTime':
    label  => 'FaceTime',
    item   => 'FaceTime',
    action => 'remove',
  }

  dockutil::item { 'Remove iBooks':
    label  => 'iBooks',
    item   => 'iBooks',
    action => 'remove',
  }

  dockutil::item { 'Remove Safari':
    label  => 'Safari',
    item   => 'Safari',
    action => 'remove',
  }
  dockutil::item { 'Remove Contacts':
    label  => 'Contacts',
    item   => 'Contacts',
    action => 'remove',
  }

  dockutil::item { 'Add Chrome':
    label  => 'Google Chrome',
    item   => '/Applications/Google Chrome.app',
  }

  dockutil::item { 'Add Chrome Canary':
    label  => 'Google Chrome Canary',
    item   => '/Applications/Google Chrome Canary.app',
  }

  dockutil::item { 'Add Multi Firefox':
    label  => 'MultiFirefox',
    item   => '/Applications/MultiFirefox.app',
  }

  dockutil::item { 'Add Opera':
    label  => 'Opera',
    item   => '/Applications/Opera.app',
  }

  dockutil::item { 'Add Iterm':
    label  => 'iTerm',
    item   => '/Applications/iTerm.app',
  }

  dockutil::item { 'Add Sublime':
    label  => 'Sublime Text',
    item   => '/Applications/Sublime Text.app',
  }

  dockutil::item { 'Add MacDown':
    label  => 'MacDown',
    item   => '/Applications/MacDown.app',
  }

  dockutil::item { 'Add Kitematic':
    label  => 'Kitematic (Beta)',
    item   => '/Applications/Docker/Kitematic (Beta).app',
  }

  dockutil::item { 'Add Paparazzi!':
    label  => 'Paparazzi!',
    item   => '/Applications/Paparazzi!.app',
  }

  dockutil::item { 'Add Sequel Pro':
    label  => 'Sequel Pro',
    item   => '/Applications/Sequel Pro.app',
  }

  dockutil::item { 'Add Tweetbot':
    label  => 'Tweetbot',
    item   => '/Applications/Tweetbot.app',
  }

  dockutil::item { 'Add Slack':
    label  => 'Slack',
    item   => '/Applications/Slack.app',
  }

  dockutil::item { 'Add Adium':
    label  => 'Adium',
    item   => '/Applications/Adium.app',
  }

  dockutil::item { 'Add Skype':
    label  => 'Skype',
    item   => '/Applications/Skype.app',
  }

  dockutil::item { 'Add Textual':
    label  => 'Textual',
    item   => '/Applications/Textual.app',
  }

  dockutil::item { 'Add Facebook Messenger':
    label  => 'Messenger',
    item   => '/Applications/Messenger.app',
  }

  dockutil::item { 'Add WhatsApp':
    label  => 'UnofficialWhatsApp',
    item   => '/Applications/UnofficialWhatsApp.app',
  }

  dockutil::item { 'Add Sunrise Calendar':
    label  => 'Sunrise Calendar',
    item   => '/Applications/Sunrise Calendar.app',
  }

  dockutil::item { 'Add Evernote':
    label  => 'Evernote',
    item   => '/Applications/Evernote.app',
  }

  dockutil::item { 'Add Pocket':
    label  => 'Pocket',
    item   => '/Applications/Pocket.app',
  }

  dockutil::item { 'Add Keynote':
    label  => 'Keynote',
    item   => '/Applications/Keynote.app',
  }

  dockutil::item { 'Add Pages':
    label  => 'Pages',
    item   => '/Applications/Pages.app',
  }

  dockutil::item { 'Add Numbers':
    label  => 'Numbers',
    item   => '/Applications/Numbers.app',
  }

  dockutil::item { 'Add Radiant Player':
    label  => 'Radiant Player',
    item   => '/Applications/Radiant Player.app',
  }

  file { "/Users/${::boxen_user}/git":
    ensure  => directory
  }

  file { 'create git symlink':
    path   => "/git",
    target => "/Users/${::boxen_user}/git",
    ensure => 'link',
    owner => 'root'
  }

  repository {
    'soundcast':
      source => 'git@github.com:danjenkins/soundcast.git',
      path => "/Users/${::boxen_user}/git/soundcast",
      provider => 'git';
  }
}
