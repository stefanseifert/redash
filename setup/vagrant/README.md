Setup redash development environment with vagrant
=================================================

* Go to root of the git repository
* Execute `vagrant up` - this sets up a new virutal machine with all dependencies
* Open a terminal session e.g. with `vagrant ssh` and execute:

    cd /opt/redash/current
    bin/run ./manage.py runserver

* Open another terminal session and execute (do not use `npm run start`, this binds only to 127.0.0.1):

    cd /opt/redash/current/client
    webpack-dev-server --content-base app --host 0.0.0.0

* Log into readash at [http://localhost:9001/] using user/password Admin/admin