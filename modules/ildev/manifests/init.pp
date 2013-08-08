# Git and related tools
class ildev {

  $files_dir = "$home/.config/puppet/modules/ildev/files"

  Package { ensure => latest }
  File { owner => $user }
  Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin/:/bin:/sbin",
    user => "$user",
    environment => "HOME=$home",
 }

  # comuns
  package { ['subversion', 'tree', 'xclip', 'curl',]: }

}
