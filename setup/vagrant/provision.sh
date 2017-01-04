#!/usr/bin/env bash


# setup dependencies
# 1. python 2.7:
sudo apt-get install -y python-pip
# 2. redis
sudo apt-get install -y redis-server
# 3. PostgreSQL
sudo apt-get install -y postgresql
# 4. Node.js
sudo apt-get install -y nodejs node npm
# bower
sudo npm install -g bower

cd /opt/redash/current
#cp /opt/redash/.env /opt/redash/current
bower install

#install requirements
sudo pip install -r /opt/redash/current/requirements_dev.txt
#sudo pip install -r /opt/redash/current/requirements.txt
#sudo pip install pymongo==3.2.1
#
##update database
#bin/run ./manage.py database drop_tables
#bin/run ./manage.py database create_tables
#bin/run ./manage.py users create --admin --password admin "Admin" "admin"
#
##Purge Redis cache
#redis-cli -n 1 FLUSHALL
