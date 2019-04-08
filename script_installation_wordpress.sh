
# WUNDER IT ### 2019 ########################################################## REZGUI # LEBRETON #
#                               SCRIPT: SCRIPT_INSTALLATION_WORDPRESS.SH                          #
###################################################################################################



########################################################################
# ADRESSE IP DE LA MACHINE LOCALE (WORDPRESS) A RENSEIGNER ICI: ########
########################################################################
IPWordpress=192.168.91.128
# exemple: IPWordpress=192.168.0.1

########################################################################
# ADRESSE IP DE LA MACHINE DISTANTE (BASE DE DONEES) A RENSEIGNER ICI: #
########################################################################
IPBaseDeDonnees=192.168.91.129
# exemple: IPBaseDeDonnees=192.168.0.2 



 #! /bin/bash



# export de l'IP base de données pour le script Wordpress

typeset -x $IPBaseDeDonnees

# check du statut ssh si non activé, on l'active et on lui fait éxécuter le script d'install mysql
systemctl status sshd.service 1>/dev/null
result=$?
if [ $result = 0 ]
  then 
    echo "ssh actif"
    # connexion
    ssh root@"$IPBaseDeDonnees" "$(<./script_mysql_install.sh)"
else
    echo "activation su service ssh"
    # activation du ssh
    service sshd start ;
    # connexion
    ssh root@"$IPBaseDeDonnees" "$(<./script_mysql_install.sh)"
fi

# appel du script wordpress
 ./script_wordpress.sh

####################################################################################################
