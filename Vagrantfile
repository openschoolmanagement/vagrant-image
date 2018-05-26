# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|



  config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "backing-local"
	config.vm.provider :virtualbox do |v|
		v.name = "backing-local"
	end

  ## Port forwarding - RabbitMQ
	config.vm.network :forwarded_port, guest: 5672, host: 5672
	config.vm.network :forwarded_port, guest: 15672, host: 15672

  ## Port forwarding - PostgreSQL
	config.vm.network :forwarded_port, guest: 5432, host: 5432

  ## Port forwarding - Redis
  config.vm.network :forwarded_port, guest: 6379, host: 6379

  ## Port forwarding - InfluxDB
  config.vm.network :forwarded_port, guest: 8086, host: 8086
  config.vm.network :forwarded_port, guest: 8083, host: 8083
  config.vm.network :forwarded_port, guest: 8088, host: 8088

  ## Port forwarding - MongoDB
  config.vm.network :forwarded_port, host: 27017, guest: 27017

  #Setup applications. The run:"always" parameter will make this run every time the machine is run.
config.vm.provision "shell", path: "./scripts/check-for-update.sh",
run: "always"

 ## Provisioning script - RabbitMQ
 config.vm.provision :shell, path: "./scripts/setup-rmq.sh"

  ## Provisioning script - PostgreSQL
  config.vm.provision :shell, path: "./scripts/setup-postgres.sh"

  ## Provisioning script - Redis
  config.vm.provision :shell, path: "./scripts/setup-redis.sh"

  ## Provisioning script - InfluxDB
  config.vm.provision :shell, path: "./scripts/setup-influxdb.sh"

  ## Provisioning script - MongoDB
  config.vm.provision :shell, path: "./scripts/setup-mongodb.sh"

  ## Provisioning script - R Programming
  ## config.vm.provision :shell, path: "./scripts/setup-r.sh"

  ## Start Up Script "What shall happen when Vagrant starts"
  config.vm.provision :shell, path: "./scripts/onVagrantUp.sh",
  run: "always"

end
