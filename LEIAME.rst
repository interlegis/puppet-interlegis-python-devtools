=============================================
 Puppet para Desktop do Desenvolvedor Python
=============================================

Instalação
==========

- Baixe este repositório na pasta ~/.config/puppet
  Para isto execute::

    cd ~/.config
    svn co http://repositorio.interlegis.leg.br/puppet/desktop_dev puppet

- Na pasta ~/.config/puppet/manifests
  crie o arquivo user.pp contendo uma linha na forma `$user = "<SEU USUÁRIO>"`.

  Para fazer isto execute::

    cd ~/.config/puppet/manifests
    echo "\$user =" `whoami` > user.pp

- Finalmente execute o puppet como root::

    sudo puppet apply ~/.config/puppet/manifests/site.pp --confdir=~/.config/puppet --verbose
