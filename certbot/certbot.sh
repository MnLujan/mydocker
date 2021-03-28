#!/usr/bin/bash
TEMPfile="/tmp/cert_cron.txt"
/bin/echo "[Centrex5] Renovacion de certificados: " > "${TEMPfile}"

/usr/bin/certbot --version >> "${TEMPfile}"

/usr/bin/certbot certonly --dry-run --noninteractive --force-renewal --webroot -w /etc/letsencrypt/ -d "${domains}" >> "${TEMPfile}" 2>&1

/bin/echo "[Centrex5]" >> "${TEMPfile}"

#/usr/sbin/service nginx restart >> "${TEMPfile}" 2>&1

#####################################
#	Mail config
#####################################
#SERVER="mail.voipgroup.com"
#FROM="dev@voipgroup.com"
#TO="${email}"

#SUBJ="[Centrex5][AUTOMATICO]Obtencion de Certificados"
#MESSAGE="$(cat ${TEMPfile})"
#CHARSET="utf-8"

echo $(cat ${TEMPfile})

/bin/echo certs: $(ls -l /etc/letsencrypt/)

#Revisar, pero en arch no existe sendmail
#/usr/sbin/sendmail -f $FROM -t $TO -u $SUBJ -s $SERVER -m "${MESSAGE}" -v -o message-charset=$CHARSET

