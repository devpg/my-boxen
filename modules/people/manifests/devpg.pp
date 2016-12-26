class people::devpg {

  # atom includes some additional packages
  include atom
  atom::package { 'linter': }
  atom::theme { 'monokai': }

  # apps via cask
  package { 'slack': provider => 'brewcask' }
}
