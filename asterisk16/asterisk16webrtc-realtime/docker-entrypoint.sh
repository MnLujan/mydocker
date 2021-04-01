#!/bin/bash

echo "CHCK VOLUME MOUNT\n"

if [ -z "$(ls -A /etc/asterisk)" ]; then
  cp -fra /etc/asterisk.org/* /etc/asterisk
  chown asterisk:asterisk -R /etc/asterisk
fi

if [ -z "$(ls -A /var/lib/asterisk/sounds)" ]; then
  cp -fra /var/lib/asterisk/sounds.org/* /var/lib/asterisk/sounds
  chown asterisk:asterisk -R /var/lib/asterisk/sounds
fi

if [ -z "$(ls -A /var/spool/asterisk/voicemail)" ]; then
  cp -fra /var/spool/asterisk/voicemail.org /var/spool/asterisk/voicemail
  chown asterisk:asterisk -R /var/spool/asterisk/voicemail
fi

if [ -d "/etc/letsencrypt" ]; then
  chown asterisk:asterisk -R /etc/letsencrypt
fi


if [ ! -f "/etc/odbc.ini" ]; then
cat > /etc/odbc.ini <<ENDLINE
[asterisk-centr3x]
Description = MySQL ODBC Driver
Driver = MySQL
Server = $MYSQL_HOST
Port = $MYSQL_PORT
Database = newcentrex
UserName = asterisk
Password = *Q1w2e3r4
Socket = /var/run/mysqld/mysqld.sock
Option=3
Charset=utf8

ENDLINE
fi

if [ ! -f "/etc/odbcinst.ini" ]; then
cat > /etc/odbcinst.ini <<ENDLINE
# Driver from the mysql-connector-odbc package
# Setup from the unixODBC package
[MySQL]
Description	= ODBC for MySQL
Driver		= /usr/lib/libmyodbc5.so
Setup		= /usr/lib/libodbcmyS.so
Driver64	= /usr/lib64/libmyodbc5.so
Setup64		= /usr/lib64/libodbcmyS.so
FileUsage	= 1
ENDLINE
fi

if [ ! -f "/etc/asterisk/res_odbc.conf" ]; then
cat > /etc/asterisk/res_odbc.conf <<ENDLINE
[asterisk]
enabled=>yes
dsn=>asterisk-centr3x
max_connections=>5
pre-connect=>yes
username=>$MYSQL_USER
password=>$MYSQL_PASSWORD
pre-connect=> yes

[mysql2]
enabled => no
dsn => MySQL-asterisk
username => myuser
password => mypass
pre-connect => yes

ENDLINE
fi

if [ ! -f "/etc/asterisk/manager.conf" ]; then
cat > /etc/asterisk/manager.conf <<ENDLINE
[general]
enabled = yes
port = 5038
bindaddr = 0.0.0.0
displayconnects=no ;only effects 1.6+
ENDLINE
fi

if [ ! -f "/etc/asterisk/sorcery.conf" ]; then
cat > /etc/asterisk/sorcery.conf <<ENDLINE
[res_pjsip]
endpoint=realtime,ps_endpoints
auth=realtime,ps_auths
aor=realtime,ps_aors
domain_alias=realtime,ps_domain_aliases
contact=realtime,ps_contacts

[res_pjsip_endpoint_identifier_ip]
identify=realtime,ps_endpoint_id_ips

[res_pjsip_outbound_registration]
registration=realtime,ps_registrations
ENDLINE
fi

if [ ! -f "/etc/asterisk/modules.conf" ]; then
cat > /etc/asterisk/modules.conf <<ENDLINE
[modules]
autoload=yes
noload => chan_alsa.so
noload => chan_console.so
load=>res_musiconhold.so
load => app_realtime.so
load => func_realtime.so
load => pbx_realtime.so
noload => res_hep.so
noload => res_hep_pjsip.so
noload => res_hep_rtcp.so
preload => res_odbc.so
preload => res_config_odbc.so
noload => chan_sip.so 
noload => cdr_mysql.so
noload => cdr_csv.so
noload => cdr_custom.so
noload => res_pjsip_config_wizard.so
ENDLINE
fi

exec "@"

asterisk -rx 'odbc show'
