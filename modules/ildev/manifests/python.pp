# Git and related tools
class ildev::python inherits ildev {

  package { [
             'python-pip', 'virtualenvwrapper', # ferramentas
             ]: }

  ################################################################
  # IPython
  package { ['ipython', 'docutils']:
    provider => 'pip',
    ensure => present, # TODO retirar isso e fazer funcionar
  }
  package {'python-tk':}    # para copiar e colar no IPython
  exec { 'ipython_profile_default' :
    command => 'ipython profile create',
    require => Package['ipython']
  }

  # IPython profile for Zope
  exec { 'ipython_profile_zope2':
    command => 'ipython profile create zope2',
    require => Package['ipython']
  }
  file { "${home}/.config/ipython/profile_zope2/startup/ipy_profile_zope.py":
    source => "${files_dir}/ipy_profile_zope.py",
    require => Exec['ipython_profile_zope2'],
  }

  ################################################################
  # VIRTUALENV
  # virtualenv compat
  #  maybe this should go into (almost) all the possible profiles  #  (at least those that do not use buildout)
  file { "${home}/.config/ipython/profile_default/startup/virtualenv-for-ipython.py":
    source => "${files_dir}/virtualenv-for-ipython.py",
    require => Exec['ipython_profile_default'],
  }

  ################################################################
  # PLONE

  # TODO apt-get build-dep python-ldap

  package { [
             # plone 4
             # de acordo com http://plone.org/documentation/manual/installing-plone/installing-on-linux-unix-bsd/debian-libraries
             'build-essential',
             'libbz2-dev',
             'libjpeg62-dev',
             'libreadline-gplv2-dev',
             'libssl-dev',
             'libxml2-dev',
             'libxslt1-dev',
             'poppler-utils',
             'python-dev',
             'wv',
             'zlib1g-dev',

             'xpdf', # XXX isso é para o portal modelo???
             ]:
  }

  # buildout cache
  $buildout_dirs = ["${home}/.buildout",
                    "${home}/.buildout/eggs",
                    "${home}/.buildout/downloads",
                    "${home}/.buildout/extends",
                    ]
  file { $buildout_dirs:
    ensure => "directory",
  }
  file { "${home}/.buildout/default.cfg":
    require => File[$buildout_dirs],
    content => "[buildout]
eggs-directory = ${home}/.buildout/eggs
download-cache = ${home}/.buildout/downloads
extends-cache = ${home}/.buildout/extends

# Newest mode off, reenable with -n
newest = false
" }

  # To debug nicely with sauna.reload
  # See https://github.com/collective/sauna.reload#debugging-with-saunareload
  file { "${home}/.pdbrc":
    source => "${files_dir}/.pdbrc",
  }

}
