# Crie o arquivo user.pp executando o comando a seguir (sem sudo)
# na mesma pasta que este arquivo (site.pp)
#
#   echo "\$user =" `whoami` > user.pp
#
# O arquivo conterá uma linha na forma "$user = <seu usuário>"
import 'user.pp'

node default {
  class { ildev: }
  class { ildev::git: }
  class { ildev::python: }
}
