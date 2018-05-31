#!/usr/bin/env bash

# Variables
DBHOST=localhost
DBNAME=OPENSCHOOLM
DBUSER=dbuser
DBPASSWD=school123


sudo apt-get -qq update

echo -e "\n--- Install MySQL specific packages and settings ---\n"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

apt-get -y install mysql-server



echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on *.* to '$DBUSER'@'%' identified by '$DBPASSWD'"

echo -e "Setting up databases for services" 
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE OSM_CALENDAR" 
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE OSM_CONTACTS"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE OSM_USER"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE OSM_CLASS"
echo -e "Setting up user for services" 
mysql -uroot -p$DBPASSWD -e "CREATE USER 'dbucalendar'@'%' IDENTIFIED BY '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "CREATE USER 'dbu_contacts'@'%' IDENTIFIED BY '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "CREATE USER 'dbu_user'@'%' IDENTIFIED BY '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "CREATE USER 'dbu_class'@'%' IDENTIFIED BY '$DBPASSWD'"
echo -e "Setting up privilges for services" 
mysql -uroot -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON OSM_CALENDAR.* TO 'dbu_calendar'@'%'"
mysql -uroot -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON OSM_CONTACTS.* TO 'dbu_contacts'@'%'"
mysql -uroot -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON OSM_USER.* TO 'dbu_user'@'%'"
mysql -uroot -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON OSM_CLASS.* TO 'dbu_class'@'%'"


cp /vagrant/mysql/my.cnf /etc/mysql/my.cnf

sudo chmod 777 /var/run/mysqld/mysqld.sock

sudo service mysql restart
