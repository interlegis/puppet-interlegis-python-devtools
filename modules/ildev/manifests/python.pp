# Git and related tools
class ildev::python inherits ildev {

  package { [
             # basicos + portal modelo + plone 4
             'build-essential',
             'libbz2-dev',
             'libfreetype6-dev',
             'libjpeg62-dev',
             'libreadline-gplv2-dev',
             'libreadline6-dev',
             'libssl-dev',
             'libxml2-dev',
             'libxslt1-dev',
             'poppler-utils',
             'python-dev',
             'readline-common',
             'wv',
             'xpdf',
             'zlib1g-dev',

             # ferramentas
             'python-pip', 'virtualenvwrapper',
             ]:
  }

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



  # virtualenv compat  #  maybe this should go into (almost) all the possible profiles  #  (at least those that do not use buildout)
  file { "${home}/.config/ipython/profile_default/startup/virtualenv-for-ipython.py":
    source => "${files_dir}/virtualenv-for-ipython.py",
    require => Exec['ipython_profile_default'],
  }

  # To debug nicely with sauna.reload
  # See https://github.com/collective/sauna.reload#debugging-with-saunareload
  file { "${home}/.pdbrc":
    source => "${files_dir}/.pdbrc",
  }

}
