# Git and related tools
class ildev {

  $files_dir = "$home/.config/puppet/modules/ildev/files"

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
    provider => 'gem',  # FIXME parece que nao esta funcionando atras do proxy
    require  => Package['rubygems'],
  }

}
