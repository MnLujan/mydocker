#!/usr/bin/env bash

certbot --version

if [ -z ${renew+x} ]; then

  if [ -z ${email+x} ]; then echo "Fatal: no set 'email' in enviroment"; exit 1; fi
  if [ -z ${domains+x} ]; then echo "Fatal: domains must be specified with the environment variable named 'domains'"; exit 1; fi

  if [ -z ${distinct+x} ]; then

    echo "CERTBOT - Obtaining certificates"
    certbot certonly --verbose --noninteractive --agree-tos --standalone --email="${email}" -d "${domains}"
    
    #Enlace simbolico a los certs
    cd /etc/letsencrypt/live && ln -s $(ls | grep -v "README")/ certificate "$@"; else

    IFS=',' read -ra ADDR <<< "$domains"
    for domain in "${ADDR[@]}"; do
        echo "for " $@;
        certbot certonly --verbose --noninteractive --quiet --standalone --agree-tos --email="${email}" -d "${domain}" "$@";
    done

  fi; else

  echo "CERTBOT - Renew certs"
  certbot renew "$@"

fi

