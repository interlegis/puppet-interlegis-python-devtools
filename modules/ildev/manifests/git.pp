# Git and related tools
class ildev::git inherits ildev {

  package { ['git', 'gitk', 'git-svn', 'meld']: }
  exec { ['git config --global color.ui true',
          'git config --global diff.tool meld',
          'git config --global merge.tool meld',
          ] :
    require => Package['git']
  }

}
