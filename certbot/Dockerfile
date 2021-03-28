FROM archlinux:base

RUN pacman -Sy certbot --noconfirm

COPY ./certbot.sh /certbot.sh

RUN chmod +x /certbot.sh

RUN certbot --version

ENTRYPOINT ["/certbot.sh"]

