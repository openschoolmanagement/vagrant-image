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

cp /vagrant/mysql/my.cnf /etc/mysql/my.cnf

sudo chmod 777 /var/run/mysqld/mysqld.sock

sudo service mysql restart
