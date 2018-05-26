#Step 0: mport the public key used by the package management system & Create a list file for MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
#Step 1: Refresh the local database with the packages
sudo apt-get update
#Step 2: Install the last stable MongoDB version and all the necessary packages on our system
sudo apt-get install -y mongodb-org
#Step 3: Refresh Upgrade packages to lastest version
sudo apt-get upgrade

#Start MongoDB
service mongod start

if test -f config.js
then
  sudo rm config.js
fi

echo 'db.createUser({ user: "admin", pwd: "pass", roles: ["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"]})' > config.js
sudo chmod 777 config.js
mongo admin config.js

sudo rm config.js


sudo cp -u /vagrant/mongodb/mongod.conf /etc/mongod.conf

service mongod restart
