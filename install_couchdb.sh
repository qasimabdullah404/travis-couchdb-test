apt-get update
apt-get --no-install-recommends -y install build-essential pkg-config erlang libicu-dev libmozjs185-dev libcurl4-openssl-dev

erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell

wget http://www-us.apache.org/dist/couchdb/source/2.0.0/apache-couchdb-2.0.0.tar.gz
tar -xvzf apache-couchdb-2.0.0.tar.gz
cd apache-couchdb-2.0.0/
./configure
make release

find rel/couchdb -type d -exec chmod 0770 {} \;
chmod 0644 rel/couchdb/etc/*
rel/couchdb/bin/couchdb 2>/dev/null &