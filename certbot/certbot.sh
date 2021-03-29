#!/usr/bin/bash
#TEMPfile="/tmp/cert_cron.txt"
/bin/echo "[Centrex5] Renovacion de certificados: "

/usr/bin/certbot --version

/usr/bin/certbot certonly --dry-run --noninteractive --verbose --quiet --standalone  -w /etc/letsencrypt/ -d floyd.voipgroup.com

/bin/echo "[Centrex5]"

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

/bin/echo certs: $(ls -l /etc/letsencrypt/)

#Revisar, pero en arch no existe sendmail
#/usr/sbin/sendmail -f $FROM -t $TO -u $SUBJ -s $SERVER -m "${MESSAGE}" -v -o message-charset=$CHARSET

