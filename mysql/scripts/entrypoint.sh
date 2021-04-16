#!/bin/bash
echo "[Entrypoint] Config MySQL DataBase"

pass="*Q1w2e3"

echo "[Entrypoint] Starting MySQL DataBase"

service mysql stop
usermod -d /var/lib/mysql/ mysql
service mysql start

cd /home/voipgroup

mysqladmin -u root password $pass
mysql --user="root" --execute="CREATE DATABASE newcentrex"
mysql -u root newcentrex < backup.sql

mysql --user="root" --password="$pass" --execute="CREATE USER 'DBAcentrex'@'%.%.%.%' IDENTIFIED BY 'DBAcentrex123'; GRANT ALL PRIVILEGES ON *.* TO 'DBAcentrex'@'%.%.%.%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

echo "[Entrypoint] Restore Backup"

/bin/bash
