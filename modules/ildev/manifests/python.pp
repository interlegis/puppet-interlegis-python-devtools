# Git and related tools
class ildev::python inherits ildev {

  package {'python-pip': }
  package {'virtualenvwrapper': }

  # IPython
  package { ['ipython', 'docutils']:
    provider => 'pip',
    ensure => present, # TODO retirar isso e fazer funcionar
  }
  exec { 'ipython_profile_default' :
    command => 'ipython profile create',
    require => Package['ipython']
  }

  $home = "/home/$user"
  $files_dir = "$home/.config/puppet/modules/ildev/files"

  # IPython profile for Zope
  exec { 'ipython_profile_zope2':
    command => 'ipython profile create zope2',
    require => Package['ipython']
  }
  file { "${home}/.config/ipython/profile_zope2/startup/ipy_profile_zope.py":
    source => "${files_dir}/ipy_profile_zope.py",
    require => Exec['ipython_profile_zope2'],
  }

  # virtualenv compat
  #  maybe this should go into (almost) all the possible profiles
  #  (at least those that do not use buildout)
  file { "${home}/.config/ipython/profile_default/startup/virtualenv-for-ipython.py":
    source => "${files_dir}/virtualenv-for-ipython.py",
    require => Exec['ipython_profile_default'],
  }

  # To debug nicely with sauna.reload
  # See https://github.com/epeli/sauna.reload#debugging-with-saunareload
  file { "${home}/.pdbrc":
    source => "${files_dir}/.pdbrc",
  }

}
