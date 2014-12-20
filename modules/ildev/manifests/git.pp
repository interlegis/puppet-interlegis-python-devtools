# Git and related tools
class ildev::git inherits ildev {

  package { ['git', 'gitk', 'git-svn', 'meld']: }

  exec { ["git config --global color.ui true",
          "git config --global diff.tool meld",
          "git config --global merge.tool meld",
          "git config --global core.excludesfile ~/.gitignore",
          "git config --global alias.st status",
          "git config --global alias.ci commit",
          "git config --global alias.co checkout",
          "git config --global alias.df 'diff --color-words'",
          "git config --global user.name '$fullname'",
          "git config --global user.email '$email'",
          # explicitly adopt default push behaviour of git 2.0 and stop warning message
          "git config --global push.default simple",
          ]:
    require => Package['git'],
  }

  file { "${home}/.gitignore":
    source => "${files_dir}/.gitignore",
    replace => no,
  }

}
