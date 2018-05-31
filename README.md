# Vagrant Box with Backing Services

## About

The configuration is meant for the following scenario:

* You want to develop an application in Java or Node.js on HANA Cloud Platform (Cloud Foundry)
* You need a local development environment with the services mentioned below.

So you can do the following:

* Install a local Java Server (Tomcat, J2EE) on your current operating system
* Or Install Node.js on your current operating system
* Connect the local services mentioned below to your local development

This box contains a vagrant VM develop environment targeting CF local development with:

* RabbitMq and RabbitMq Web Management
* PostgreSQL
* Redis
* InfluxDB
* MongoDB
* R Programming Language

## Install

* Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Download and install [Vagrant](http://downloads.vagrantup.com/)
* (optional) Reboot your machine (I had the issue on macOS)
* Before cloning the project please run this command for GIT: "git config --global core.autocrlf false" - It prevents the encoding of the files to be corrupted.
* Clone the project
* (optional) Go into each bootstrap file and change User/password for the services
* If you have to use a proxy server to access the internet, install the [Vagrant proxyconf plugin](https://github.com/tmatilai/vagrant-proxyconf): `vagrant plugin install vagrant-proxyconf`. Otherwise, change your network to SAP-Internet.
* In the project dir run `vagrant up`. The VM will be provisioned. After that, you can move back to corporate network.

## Installed Services

### RabbitMQ

What can RabbitMQ do for you?

Messaging enables software applications to connect and scale. Applications can connect to each other, as components of a larger application, or to user devices and data. Messaging is asynchronous, decoupling applications by separating sending and receiving data.

You may be thinking of data delivery, non-blocking operations or push notifications. Or you want to use publish / subscribe, asynchronous processing, or work queues. All these are patterns, and they form part of messaging.

RabbitMQ is a messaging broker - an intermediary for messaging. It gives your applications a common platform to send and receive messages, and your messages a safe place to live until received.

host: localhost
port: 5672

### RabbitMQ Web client

url: http://localhost:15672/  
username / password: rmq / pass

### PostgreSQL

PostgreSQL is a powerful, open source object-relational database system. It has more than 15 years of active development and a proven architecture that has earned it a strong reputation for reliability, data integrity, and correctness. It runs on all major operating systems, including Linux, UNIX (AIX, BSD, HP-UX, SGI IRIX, Mac OS X, Solaris, Tru64), and Windows. It is fully ACID compliant, has full support for foreign keys, joins, views, triggers, and stored procedures (in multiple languages). It includes most SQL:2008 data types, including INTEGER, NUMERIC, BOOLEAN, CHAR, VARCHAR, DATE, INTERVAL, and TIMESTAMP. It also supports storage of binary large objects, including pictures, sounds, or video. It has native programming interfaces for C/C++, Java, .Net, Perl, Python, Ruby, Tcl, ODBC, among others, and exceptional documentation.

uri: postgresql://myapp:dbpass@localhost:5432/myapp

### Redis

Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker. It supports data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs and geospatial indexes with radius queries. Redis has built-in replication, Lua scripting, LRU eviction, transactions and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.

host: localhost
port: 6379
pass: pass1 => change the password in (./redis/redis.conf)[./redis/redis.conf].

### InfluxDB

InfluxDB is an open source database written in Go specifically to handle time series data with high availability and high performance requirements. InfluxDB installs in minutes without external dependencies, yet is flexible and scalable enough for complex deployments.

host: localhost
port: 8086
username / password: admin / pass

### MongoDB

MongoDB (from humongous) is a free and open-source cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemas. MongoDB is developed by MongoDB Inc. and is free and open-source, published under a combination of the GNU Affero General Public License and the Apache License.

host: localhost
port: 27017
username / password: admin / pass

### MySQL

MySQL is an open-source relational database management system (RDBMS). Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language. The MySQL development project has made its source code available under the terms of the GNU General Public License, as well as under a variety of proprietary agreements. MySQL was owned and sponsored by a single for-profit firm, the Swedish company MySQL AB, now owned by Oracle Corporation.[8] For proprietary use, several paid editions are available, and offer additional functionality.

DB User: dbuser
Password: school123
Created DB is: OPENSCHOOLM

| Database     | User         | Password  |
| ------------ | ------------ | --------- |
| OSM_CALENDAR | dbu_calendar | school123 |
| OSM_CONTACTS | dbu_contacts | school123 |
| OSM_CLASS    | dbu_class    | school123 |
| OSM_USER     | dbu_user     | school123 |

## default-services.json

Basic default-services.json file for the provisioned services:

```
{
    "rabbitmq": {
        "hostname": "localhost",
        "password": "pass",
        "port": "5672",
        "uri": "amqp://rmq:pass@localhost:5672",
        "username": "rmq"
    },
    "postgresql": {
        "dbname": "myapp",
        "hostname": "localhost",
        "password": "dbpass",
        "port": "5432",
        "uri": "postgresql://myapp:dbpass@localhost:5432/myapp",
        "username": "myapp"
    },
    "redis": {
        "hostname": "localhost",
        "password": "pass1",
        "port": "6379"
    },
    "influxdb": {
        "hostname": "localhost",
        "port": "8086",
        "user": "admin"
        "password": "pass",
    },
    "mongodb": {
        "hostname": "localhost",
        "port": "27017",
        "user": "admin"
        "password": "pass",
    }
}
```
