FROM mysql:8.0

# mysqld.cnf bind-address = 0.0.0.0
COPY files/mysqld.cnf /etc/mysql/mysql.conf.d/

# backup to restore
COPY files/backup.sql /home/database/

# script for entrypoint
COPY scripts/ opt/scripts/

RUN chmod +x /opt/scripts/entrypoint.sh

WORKDIR /opt/scripts

EXPOSE  3306 33006

ENTRYPOINT ["./entrypoint.sh"]