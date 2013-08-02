# Git and related tools
class ildev::recess inherits ildev {

  exec { "ppa_chris_lea_node":
    command => "add-apt-repository --yes ppa:chris-lea/node.js && apt-get update",
    user    => "root",
  }

  package {'nodejs':
    ensure => latest,
    require => Exec['ppa_chris_lea_node'],
  }

  exec { "npm install -g recess -verbose":
    user => "root",
    require => Package['nodejs'],
  }

}
