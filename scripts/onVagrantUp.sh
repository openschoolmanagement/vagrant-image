
##Start Influx DB
if (( $(ps -ef | grep -v grep | grep influxdb | wc -l) > 0 ))
then
echo "influxdb is running!!!"
else
service influxdb start
fi


##Start Mongo DB
if (( $(ps -ef | grep -v grep | grep mongod | wc -l) > 0 ))
then
echo "mongod is running!!!"
else
service mongod --auth start
fi

##Start PostgreSQL DB
if (( $(ps -ef | grep -v grep | grep postgresql | wc -l) > 0 ))
then
echo "postgresql is running!!!"
else
service postgresql start
fi

##Start Redis
if (( $(ps -ef | grep -v grep | grep /etc/init.d/redis_6379 | wc -l) > 0 ))
then
echo "redis_6379 is running!!!"
else
/etc/init.d/redis_6379 start
fi

#Start RabbitMQ
if (( $(ps -ef | grep -v grep | grep rabbitmq-server | wc -l) > 0 ))
then
echo "rabbitmq is running!!!"
else
  service rabbitmq-server start
fi


#Start MySql
if (( $(ps -ef | grep -v grep | grep mysql | wc -l) > 0 ))
then
echo "mysql is running!!!"
else
  sudo service mysql start
fi