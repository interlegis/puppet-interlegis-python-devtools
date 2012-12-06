=============================================
 Puppet para Desktop do Desenvolvedor Python
=============================================

Instalação
==========

- Baixe este repositório na pasta ~/.config/puppet::
 ~/.config
    svn co http://repositorio.interlegis.leg.br/puppet/desktop_dev puppet

- Execute o puppet como root (substitua <seu usuario> por seu usuario de sistema)::

    sudo FACTER_user=<seu usuario> puppet apply ~/.config/puppet/manifests/site.pp --confdir=~/.config/puppet --verbose
