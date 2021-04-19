FROM ubuntu:focal

RUN apt update

RUN apt install -y mysql-server nano net-tools

# mysqld.cnf bind-address = 0.0.0.0
COPY files/mysqld.cnf /etc/mysql/mysql.conf.d/

# backup to restore
COPY files/backup.sql /

# script for entrypoint
COPY scripts/ /

RUN chmod +x /entrypoint.sh

WORKDIR /

EXPOSE  3306 33006

ENTRYPOINT ["./entrypoint.sh"]