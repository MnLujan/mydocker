#!/bin/bash

echo "CHCK VOLUME MOUNT\n"

if [ -z "$(ls -A /etc/asterisk)" ]; then
  cp -fra /etc/asterisk.org/* /etc/asterisk
fi

if [ -z "$(ls -A /var/lib/asterisk/sounds)" ]; then
  cp -fra /var/lib/asterisk/sounds.org/* /var/lib/asterisk/sounds
fi

if [ -z "$(ls -A /var/spool/asterisk/voicemail)" ]; then
  cp -fra /var/spool/asterisk/voicemail.org /var/spool/asterisk/voicemail
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

[mysql2]
enabled => no
dsn => MySQL-asterisk
username => myuser
password => mypass
pre-connect => yes

[asteriskdb]
enabled=>yes
dsn=>asteriskcdr
max_connections=>5
pre-connect=>yes
username=>asterisk
password=>*Q1w2e3r4
ENDLINE
fi

if [ ! -f "/etc/asterisk/manager.conf" ]; then
cat > /etc/asterisk/manager.conf <<ENDLINE
[general]
enabled = yes
port = 5038
bindaddr = 127.0.0.1
displayconnects=no ;only effects 1.6+

[${ASTERISK_MANAGER_USER}]
secret = ${ASTERISK_MANAGER_SECRET}
deny = 0.0.0.0/0.0.0.0
permit = 127.0.0.1/255.255.255.0
read = all
write = all
writetimeout = 1000
eventfilter=!Event: RTCP*
eventfilter=!Event: VarSet
eventfilter=!Event: Cdr
eventfilter=!Event: DTMF
eventfilter=!Event: AGIExec
eventfilter=!Event: ExtensionStatus
eventfilter=!Event: ChannelUpdate
eventfilter=!Event: ChallengeSent
eventfilter=!Event: SuccessfulAuth
eventfilter=!Event: DeviceStateChange
eventfilter=!Event: RequestBadFormat
eventfilter=!Event: MusicOnHoldStart
eventfilter=!Event: MusicOnHoldStop
eventfilter=!Event: NewAccountCode
eventfilter=!Event: DeviceStateChange
ENDLINE
fi


#custom pjsip_template.conf
PJSIP_USER_AGENT=`cat /etc/asterisk/pjsip_template.conf | grep _USER_AGENT_ |cut -d '=' -f2 | head -1`
PJSIP_EXTERNAL_MEDIA_ADDRESS=`cat /etc/asterisk/pjsip_template.conf | grep _PJSIP_EXTERNAL_MEDIA_ADDRESS_ |cut -d '=' -f2 | head -1`
PJSIP_EXTERNAL_SIGNALING_ADDRESS=`cat /etc/asterisk/pjsip_template.conf | grep _PJSIP_EXTERNAL_SIGNALING_ADDRESS_ |cut -d '=' -f2 | head -1`
PJSIP_LOCAL_NET=`cat /etc/asterisk/pjsip_template.conf | grep _PJSIP_LOCAL_NET_ |cut -d '=' -f2 | head -1`

if [ "$PJSIP_USER_AGENT" = '_USER_AGENT_' ] && [ "$ASTERISK_USER_AGENT" != '' ] && [ "$PJSIP_EXTERNAL_MEDIA_ADDRESS" = '_PJSIP_EXTERNAL_MEDIA_ADDRESS_' ] && [ "$ASTERISK_PJSIP_EXTERNAL_MEDIA_ADDRESS" != '' ] && [ "$PJSIP_EXTERNAL_SIGNALING_ADDRESS" = '_PJSIP_EXTERNAL_SIGNALING_ADDRESS_' ] && [ "$ASTERISK_PJSIP_EXTERNAL_SIGNALING_ADDRESS" != '' ] && [ "$PJSIP_LOCAL_NET" = '_PJSIP_LOCAL_NET_' ] && [ "$ASTERISK_PJSIP_LOCAL_NET" != '' ];then
  sed -i "s/_USER_AGENT_/${ASTERISK_USER_AGENT}/g" "/etc/asterisk/pjsip_template.conf"
  sed -i "s/_PJSIP_EXTERNAL_MEDIA_ADDRESS_/${ASTERISK_PJSIP_EXTERNAL_MEDIA_ADDRESS}/g" "/etc/asterisk/pjsip_template.conf"
  sed -i "s/_PJSIP_EXTERNAL_SIGNALING_ADDRESS_/${ASTERISK_PJSIP_EXTERNAL_SIGNALING_ADDRESS}/g" "/etc/asterisk/pjsip_template.conf"
  ASTERISK_PJSIP_LOCAL_NET01=`echo ${ASTERISK_PJSIP_LOCAL_NET} | tr "/" "\n" | head -1`
  ASTERISK_PJSIP_LOCAL_NET02=`echo ${ASTERISK_PJSIP_LOCAL_NET} | tr "/" "\n" | tail  -1`
  sed -i "s/_PJSIP_LOCAL_NET_/${ASTERISK_PJSIP_LOCAL_NET01}\/${ASTERISK_PJSIP_LOCAL_NET02}/g" "/etc/asterisk/pjsip_template.conf"
fi

#custom sip.conf
SIP_USER_AGENT=`cat /etc/asterisk/sip.conf | grep _USER_AGENT_ |cut -d '=' -f2 | head -1`
SIP_EXTERN_ADDR=`cat /etc/asterisk/sip.conf | grep _SIP_EXTERN_ADDR_ |cut -d '=' -f2 | head -1`
SIP_LOCAL_NET=`cat /etc/asterisk/sip.conf | grep _SIP_LOCAL_NET_ |cut -d '=' -f2 | head -1`

if [ "$SIP_USER_AGENT" = '_USER_AGENT_' ] && [ "$ASTERISK_USER_AGENT" != '' ] && [ "$SIP_EXTERN_ADDR" = '_SIP_EXTERN_ADDR_' ] && [ "$ASTERISK_SIP_EXTERN_ADDR" != '' ] && [ "$SIP_LOCAL_NET" = '_SIP_LOCAL_NET_' ] && [ "$ASTERISK_SIP_LOCAL_NET" != '' ];then
  sed -i "s/_USER_AGENT_/${ASTERISK_USER_AGENT}/g" "/etc/asterisk/sip.conf"
  sed -i "s/_SIP_EXTERN_ADDR_/${ASTERISK_SIP_EXTERN_ADDR}/g" "/etc/asterisk/sip.conf"
  ASTERISK_SIP_LOCAL_NET01=`echo ${ASTERISK_SIP_LOCAL_NET} | tr "/" "\n" | head -1`
  ASTERISK_SIP_LOCAL_NET02=`echo ${ASTERISK_SIP_LOCAL_NET} | tr "/" "\n" | tail  -1`
  sed -i "s/_SIP_LOCAL_NET_/${ASTERISK_SIP_LOCAL_NET01}\/${ASTERISK_SIP_LOCAL_NET02}/g"  "/etc/asterisk/sip.conf"
fi

exec "$@"
