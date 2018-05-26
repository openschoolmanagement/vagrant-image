#!/usr/bin/env bash

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqladmin'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqladmin'
sudo apt-get update
sudo apt-get install -y mysql-server