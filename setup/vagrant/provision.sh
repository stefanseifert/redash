#!/usr/bin/env bash

sudo apt-get -y update

# setup dependencies
# 1. python 2.7: (newer version 2.7.12 to ensure ds requirements can be installed)
sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
cd /usr/src
sudo wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz
sudo tar xzf Python-2.7.12.tgz
cd Python-2.7.12
sudo ./configure
sudo make altinstall
# 2. redis
sudo apt-get install -y redis-server
# 3. PostgreSQL
sudo apt-get -y install postgresql-9.3 postgresql-server-dev-9.3
# 4. Node.js
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential
# git
sudo apt-get install -y git

# install some frontend tools globally
sudo npm install -g webpack
sudo npm install -g webpack-dev-server

cd /opt/redash/current
cp /opt/redash/current/setup/vagrant/files/env /opt/redash/current/.env
bower install

#install requirements
sudo pip2.7 install -r /opt/redash/current/requirements_dev.txt
sudo pip2.7 install -r /opt/redash/current/requirements.txt
sudo pip2.7 install -r /opt/redash/current/requirements_all_ds.txt

#create database
sudo -u postgres createuser vagrant --no-superuser --no-createdb --no-createrole
sudo -u postgres createdb redash --owner=vagrant
bin/run ./manage.py database create_tables
bin/run ./manage.py users create --admin --password admin "Admin" "admin"

#Purge Redis cache
redis-cli -n 1 FLUSHALL

#prepare client
cd /opt/redash/current/client
npm install --no-bin-links
