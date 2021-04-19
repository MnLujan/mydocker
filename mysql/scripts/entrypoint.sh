#!/bin/bash
echo "[`date`][Entrypoint] Starting MySQL DataBase"

echo "[`date`][Entrypoint] Config MySQL DataBase"

cd /home/database

service mysql start

echo "[`date`][Entrypoint] Restore Backup"
mysql --user="root" --execute="CREATE DATABASE newcentrex"
mysql -u root newcentrex < backup.sql
echo "[`date`][Entrypoint] Creater User"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'centrex'@'127.0.0.1' IDENTIFIED BY 'centrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'centrex'@'localhost' IDENTIFIED BY 'centrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'centrex'@'%.%.%.%' IDENTIFIED BY 'centrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'DBAcentrex'@'%.%.%.%' IDENTIFIED BY 'DBAcentrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'root'@'%.%.%.%' IDENTIFIED BY 'DBAcentrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON newcentrex.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'DBAcentrex123' WITH GRANT OPTION; FLUSH PRIVILEGES;"

echo "[`date`][Entrypoint] BD ready !"

/bin/bash
