#!/bin/bash

apt-get update

apt-get -y install make
apt-get -y install tcl

mkdir /opt/redis

cd /opt/redis
# Use latest stable
wget -q http://download.redis.io/redis-stable.tar.gz
# Only update newer files
tar xvzf redis-stable.tar.gz

cd redis-stable
make
make install

if [ -e /etc/redis.conf]
then
  rm /etc/redis.conf
else
  echo "/etc/redis.conf does not exist"
fi

mkdir -p /etc/redis
mkdir /var/redis
chmod -R 777 /var/redis
useradd redis

cp -u /vagrant/redis/redis.conf /etc/redis/6379.conf
cp -u /vagrant/redis/redis.init.d /etc/init.d/redis_6379

update-rc.d redis_6379 defaults

chmod a+x /etc/init.d/redis_6379

if [ -e /etc/redis.conf]
then
  rm /etc/redis.conf
else
  echo "/etc/redis.conf does not exist"
fi

/etc/init.d/redis_6379 start
