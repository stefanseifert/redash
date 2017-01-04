#!/usr/bin/env bash

sudo apt-get -y update

# setup dependencies
# 1. python 2.7:
sudo apt-get install -y python-pip python-dev
sudo pip install --upgrade pip
# 2. redis
sudo apt-get install -y redis-server
# 3. PostgreSQL
sudo apt-get -y install postgresql-9.3 postgresql-server-dev-9.3
# 4. Node.js
sudo apt-get install -y nodejs node npm
# bower
sudo npm install -g bower

cd /opt/redash/current
cp /opt/redash/current/setup/vagrant/files/env /opt/redash/current/.env
bower install

#install requirements
sudo pip install -r /opt/redash/current/requirements_dev.txt
sudo pip install -r /opt/redash/current/requirements.txt
sudo pip install pymongo==3.2.1

#update database
#bin/run ./manage.py database drop_tables
#bin/run ./manage.py database create_tables
#bin/run ./manage.py users create --admin --password admin "Admin" "admin"
#
##Purge Redis cache
#redis-cli -n 1 FLUSHALL
