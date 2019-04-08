
# WUNDER IT ### 2019 ########################################################## REZGUI # LEBRETON #
#                                SCRIPT: SCRIPT_MYSQL_INSTALLATION.SH                             #
###################################################################################################


 #! /bin/bash


 
# ouverture du port sur firewall

firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload
 
# installation mysql mariadb

yum -y install mariadb-server httpd php php-mysql
systemctl enable mariadb.service
systemctl start mariadb.service

# creation BDD + ajout des privilèges pour wordpress sur la BDD

echo 'CREATE DATABASE wordpress;' | mysql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'password';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
exit

# déconnexion ssh
exit

####################################################################################################