FROM ubuntu:focal
RUN apt update
RUN apt -y upgrade
RUN apt -y install vim
RUN apt -y install net-tools

# mysql intallation
RUN apt install -y mysql-server

# mysqld.cnf bind-address = 0.0.0.0
COPY files/mysqld.cnf /etc/mysql/mysql.conf.d/

# backup to restore
COPY files/backup.sql /home/voipgroup/

# script for entrypoint
COPY scripts/ opt/scripts/
RUN chmod +x /opt/scripts/entrypoint.sh
WORKDIR /opt/scripts
ENTRYPOINT ./entrypoint.sh