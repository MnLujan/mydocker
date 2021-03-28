FROM debian:buster-slim

RUN apt install -y certbot

COPY ./certbot.sh /certbot.sh

RUN chmod +x /certbot.sh

RUN certbot --version

ENTRYPOINT ["/certbot.sh"]

