#!/usr/bin/env bash

USER_NAME=rmq
USER_PASSWORD=pass

cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
EOT

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

apt-get update
apt-get install -q -y screen htop vim curl wget
apt-get install -q -y --force-yes rabbitmq-server

rabbitmqctl add_user $USER_NAME $USER_PASSWORD
rabbitmqctl set_user_tags $USER_NAME administrator
rabbitmqctl set_permissions $USER_NAME ".*" ".*" ".*"

# RabbitMQ Plugins
service rabbitmq-server stop
rabbitmq-plugins enable rabbitmq_management
#rabbitmq-plugins enable rabbitmq_jsonrpc
#rabbitmq-plugins enable rabbitmq_federation
#rabbitmq-plugins enable rabbitmq_federation_management
service rabbitmq-server start
