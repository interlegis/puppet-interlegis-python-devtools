# Git and related tools
class ildev {

  Package { ensure => latest }
  File { owner => $user }
  Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin/:/bin:/sbin",
    user => "$user",
  }

  # comuns
  package { ['subversion', 'tree', 'xclip', ]: }

  ################ SASS ################
  package { 'rubygems': }
  package { ['sass', 'listen']:
    provider => 'gem',
    require  => Package['rubygems'],
  }

}
