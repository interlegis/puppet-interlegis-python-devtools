=============================================
 Puppet para Desktop do Desenvolvedor Python
=============================================

Instalação
==========

- Instale o puppet::
    sudo apt-get install puppet

- Baixe este repositório na pasta ~/.config/puppet::
    cd ~/.config
    git clone git@github.com:interlegis/puppet-interlegis-python-devtools.git puppet

- Execute os seguintes comandos, trocando os valores das variáveis FACTER_* por seus dados::

    sudo FACTER_user=seu_usuario \
    FACTER_home=~seu_usuario \
    FACTER_fullname="Joao Seu Nome da Silva" \
    FACTER_email=seu.email@interlegis.leg.br \
    puppet apply ~/.config/puppet/manifests/site.pp --confdir=~/.config/puppet --verbose
