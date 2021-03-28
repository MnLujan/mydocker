#!/usr/local/bin/bash
TEMPfile="/tmp/cert_cron.txt"
/bin/echo "[Proxy] Renovacion de certificados: " > "${TEMPfile}"
/usr/local/bin/certbot certonly --dry-run --noninteractive --force-renewal --webroot -w /etc/letsencrypt/ -d floyd.voipgroup.com >> "${TEMPfile}" 2>&1

/bin/echo "[Proxy] Nginx restart: " >> "${TEMPfile}"

#/usr/sbin/service nginx restart >> "${TEMPfile}" 2>&1

#####################################
#	Mail config
#####################################
SERVER="pegaso.psi.unc.edu.ar"
FROM="lev2@fcefyn.unc.edu.ar"
TO="lc.fcefyn@gmail.com"
SUBJ="[Proxy-homer][AUTOMATICO]Renovacion de Certificados"
MESSAGE="$(cat ${TEMPfile})"
CHARSET="utf-8"

echo ${ls -l /etc/letsencrypt/}

#/usr/local/bin/sendEmail -f $FROM -t $TO -u $SUBJ -s $SERVER -m "${MESSAGE}" -v -o message-charset=$CHARSET

