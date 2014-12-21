node default {
  class { ildev: }
  class { ildev::git: }
  class { ildev::python: }
  class { ildev::node: }
  class { ildev::ruby: }
}
