# Git and related tools
class ildev::git inherits ildev {

  package { ['git', 'gitk', 'git-svn', 'meld']: }

  exec { 'config':
    command => 'git config --global color.ui true ; \
                git config --global diff.tool meld ; \
                git config --global merge.tool meld ; \
                git config --global core.excludesfile ~/.gitignore_global',
    require => Package['git'],
  }

  file { "${home}/.gitignore_global":
    source => "${files_dir}/.gitignore_global",
    require => Exec['config'],
  }

}
