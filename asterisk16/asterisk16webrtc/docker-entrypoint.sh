#!/bin/bash

echo "CHECK VOLUME's MOUNT\n"

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

if [ ! -f "/etc/asterisk/manager.conf" ]; then
cat > /etc/asterisk/manager.conf <<ENDLINE
[general]
enabled = yes
displayconnects=no ;only effects 1.6+

ENDLINE
fi


if [ "$PJSIP_USER_AGENT" = '_USER_AGENT_' ] && [ "$ASTERISK_USER_AGENT" != '' ] && [ "$PJSIP_EXTERNAL_MEDIA_ADDRESS" = '_PJSIP_EXTERNAL_MEDIA_ADDRESS_' ] && [ "$ASTERISK_PJSIP_EXTERNAL_MEDIA_ADDRESS" != '' ] && [ "$PJSIP_EXTERNAL_SIGNALING_ADDRESS" = '_PJSIP_EXTERNAL_SIGNALING_ADDRESS_' ] && [ "$ASTERISK_PJSIP_EXTERNAL_SIGNALING_ADDRESS" != '' ] && [ "$PJSIP_LOCAL_NET" = '_PJSIP_LOCAL_NET_' ] && [ "$ASTERISK_PJSIP_LOCAL_NET" != '' ];then
  sed -i "s/_USER_AGENT_/${ASTERISK_USER_AGENT}/g" "/etc/asterisk/pjsip_template.conf"
  sed -i "s/_PJSIP_EXTERNAL_MEDIA_ADDRESS_/${ASTERISK_PJSIP_EXTERNAL_MEDIA_ADDRESS}/g" "/etc/asterisk/pjsip_template.conf"
  sed -i "s/_PJSIP_EXTERNAL_SIGNALING_ADDRESS_/${ASTERISK_PJSIP_EXTERNAL_SIGNALING_ADDRESS}/g" "/etc/asterisk/pjsip_template.conf"
  ASTERISK_PJSIP_LOCAL_NET01=`echo ${ASTERISK_PJSIP_LOCAL_NET} | tr "/" "\n" | head -1`
  ASTERISK_PJSIP_LOCAL_NET02=`echo ${ASTERISK_PJSIP_LOCAL_NET} | tr "/" "\n" | tail  -1`
  sed -i "s/_PJSIP_LOCAL_NET_/${ASTERISK_PJSIP_LOCAL_NET01}\/${ASTERISK_PJSIP_LOCAL_NET02}/g" "/etc/asterisk/pjsip_template.conf"
fi

if [ "$SIP_USER_AGENT" = '_USER_AGENT_' ] && [ "$ASTERISK_USER_AGENT" != '' ] && [ "$SIP_EXTERN_ADDR" = '_SIP_EXTERN_ADDR_' ] && [ "$ASTERISK_SIP_EXTERN_ADDR" != '' ] && [ "$SIP_LOCAL_NET" = '_SIP_LOCAL_NET_' ] && [ "$ASTERISK_SIP_LOCAL_NET" != '' ];then
  sed -i "s/_USER_AGENT_/${ASTERISK_USER_AGENT}/g" "/etc/asterisk/sip.conf"
  sed -i "s/_SIP_EXTERN_ADDR_/${ASTERISK_SIP_EXTERN_ADDR}/g" "/etc/asterisk/sip.conf"
  ASTERISK_SIP_LOCAL_NET01=`echo ${ASTERISK_SIP_LOCAL_NET} | tr "/" "\n" | head -1`
  ASTERISK_SIP_LOCAL_NET02=`echo ${ASTERISK_SIP_LOCAL_NET} | tr "/" "\n" | tail  -1`
  sed -i "s/_SIP_LOCAL_NET_/${ASTERISK_SIP_LOCAL_NET01}\/${ASTERISK_SIP_LOCAL_NET02}/g"  "/etc/asterisk/sip.conf"
fi

exec "$@"
