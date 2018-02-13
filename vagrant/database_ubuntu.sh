#!/bin/sh -e

USERNAME=master
DATABASE_DEVELOPMENT=socialproject_development
DATABASE_TEST=socialproject_test

sudo -u postgres psql -c "CREATE ROLE $USERNAME SUPERUSER LOGIN;"
sudo -u postgres psql -tc "SELECT 1 FROM pg_database WHERE datname = '$DATABASE_DEVELOPMENT'" | grep -q 1 || sudo -u postgres psql -c "CREATE DATABASE $DATABASE_DEVELOPMENT OWNER $USERNAME"
sudo -u postgres psql -tc "SELECT 1 FROM pg_database WHERE datname = '$DATABASE_TEST'" | grep -q 1 || sudo -u postgres psql -c "CREATE DATABASE $DATABASE_TEST OWNER $USERNAME"

sudo -su root

# clear file content
: > "/etc/postgresql/9.6/main/pg_hba.conf"

echo "local   all             postgres                                peer" >> "/etc/postgresql/9.6/main/pg_hba.conf"
echo "local   all             $USERNAME                               trust" >> "/etc/postgresql/9.6/main/pg_hba.conf"
echo "host    all             all           all                       trust" >> "/etc/postgresql/9.6/main/pg_hba.conf"

# Edit postgresql.conf to change listen address to '*'
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "/etc/postgresql/9.6/main/postgresql.conf"

exit

sudo service postgresql restart
