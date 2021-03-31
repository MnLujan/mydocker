#!/bin/bash

pass="*Q!w2e3"

service mysql stop
usermod -d /var/lib/mysql/ mysql
service mysql start

cd /home/voipgroup

mysqladmin -u root password $pass

mysql --user="root" --password="$pass" --execute="CREATE DATABASE newcentrex; CREATE USER 'DBAcentrex'@'%.%.%.%' IDENTIFIED BY 'DBAcentrex123'; GRANT ALL PRIVILEGES ON *.* TO 'DBAcentrex'@'%.%.%.%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -p$pass newcentrex < backup.sql

/bin/bash