curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release

echo "deb https://repos.influxdata.com/ubuntu trusty stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt-get update
sudo apt-get install -y influxdb


sudo service influxdb start

influx -execute "CREATE USER admin WITH PASSWORD 'pass' WITH ALL PRIVILEGES"

if test -f "/etc/influxdb/influxdb.conf"
then
  echo "Influx Enabling AUTH"
  sudo sed -i 's/# auth-enabled = false/ auth-enabled = true/' /etc/influxdb/influxdb.conf
  echo "Influx Enabled AUTH"
  echo "Please restart influxdb!"
else
  echo "/etc/influxdb/influxdb.conf does not exist"
fi

echo "Restart InfluxDB"
sudo service influxdb restart
