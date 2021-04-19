#!/bin/bash
echo "[`date`][Entrypoint] Starting MySQL DataBase";

echo "[`date`][Entrypoint] Config MySQL DataBase";

service mysql start

if [[-d "/var/lib/mysql/newcentrex" ]]; then
    echo "[`date`][Entrypoint] Database and user is ready!";
    continue;
else
    cd /
    mysql --user="root" --execute="CREATE DATABASE IF NOT EXISTS newcentrex;"
    echo "[`date`][Entrypoint] Restore Backup"
    mysql -u root newcentrex < backup.sql
    echo "[`date`][Entrypoint] Creater User"
    mysql --user="root" --execute="CREATE USER 'centrex'@'127.0.0.1' IDENTIFIED BY 'centrex123'; GRANT ALL PRIVILEGES ON newcentrex.* TO 'centrex'@'127.0.0.1' WITH GRANT OPTION;
    CREATE USER 'centrex'@'%.%.%.%' IDENTIFIED BY 'centrex123'; GRANT ALL PRIVILEGES ON newcentrex.* TO 'centrex'@'%.%.%.%' WITH GRANT OPTION;
    CREATE USER 'DBAcentrex'@'%.%.%.%' IDENTIFIED BY 'DBAcentrex123'; GRANT ALL PRIVILEGES ON *.* TO 'DBAcentrex'@'%.%.%.%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;"
fi;

echo "[`date`][Entrypoint] BD ready !";

/bin/bash
