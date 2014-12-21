class ildev::node inherits ildev {

  exec { "ppa_chris_lea_node":
    command => "add-apt-repository --yes ppa:chris-lea/node.js && apt-get update",
    user    => "root",
  }

  package {'nodejs':
    ensure => latest,
    require => Exec['ppa_chris_lea_node'],
  }

  # TOOLS

  exec { "npm install -g recess -verbose":
    user => "root",
    require => Package['nodejs'],
  }

}
