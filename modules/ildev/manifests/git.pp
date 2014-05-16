# Git and related tools
class ildev::git inherits ildev {

  package { ['git', 'gitk', 'git-svn', 'meld']: }

  exec { ["git config --system color.ui true",
          "git config --system diff.tool meld",
          "git config --system merge.tool meld",
          "git config --system core.excludesfile ~/.gitignore",
          "git config --system alias.st status",
          "git config --system alias.ci commit",
          "git config --system alias.co checkout",
          "git config --system alias.df 'diff --color-words'",
          "git config --global user.name '$fullname'",
          "git config --global user.email '$email'",
          ]:
    require => Package['git'],
  }

  file { "${home}/.gitignore":
    source => "${files_dir}/.gitignore",
  }

}
