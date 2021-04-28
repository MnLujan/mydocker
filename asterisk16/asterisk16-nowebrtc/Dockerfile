##############################################################################################################
#                                      Primera Etapa - Compilacion de Asterisk
##############################################################################################################
FROM debian:buster-slim AS compiler

LABEL maintainer="Martin Lujan <mlujan@voipgroup.com>"

ENV DEBIAN_FRONTEND=noninteractive\
        Asterisk=16

#Actualizo los repos y OS
RUN apt update 

#Instalo Dependencias
RUN apt install -y --no-install-recommends --no-install-suggests \
        asterisk-dev \
        autoconf \
        automake \
        binutils-dev \
        build-essential \
        ca-certificates \
        curl \
        file \
        git \
        libcurl4-openssl-dev \
        libedit-dev \
        libgsm1-dev \
        libjansson-dev \
        libncurses5-dev \
        libogg-dev \
        libpopt-dev \
        libresample1-dev \
        libspandsp-dev \
        libspeex-dev \
        libspeexdsp-dev \
        libsqlite3-dev \
        libsrtp2-dev \
        libtool \
        libnewt-dev \
        libssl-dev \
        libvorbis-dev \
        libxml2-dev \
        libxslt1-dev \
        m4 \
        make \
        msmtp \
        net-tools \
        procps \
        portaudio19-dev \
        unixodbc \
        unixodbc-bin \
        unixodbc-dev \
        odbcinst \
        sngrep \
        subversion \
        tzdata \
        uuid \
        uuid-dev \
        unzip \
        xmlstarlet \
        wget \
        && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

#Compilo Asterisk realtime
RUN cd /usr/src/ \
        && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${Asterisk}-current.tar.gz \
        && tar xfz asterisk-* \
        && rm -f asterisk-*.tar.gz \
	    && mv asterisk-* asterisk \
        && cd asterisk \
        && contrib/scripts/get_mp3_source.sh \
        && contrib/scripts/install_prereq install \
        && ./configure --libdir=/usr/lib --prefix=/usr --with-pjproject-bundled --with-jansson-bundled --with-ssl=ssl --with-srtp CFLAGS='-O2 -DNDEBUG' \
        && make menuselect/menuselect menuselect-tree menuselect.makeopts \
        && menuselect/menuselect --disable BUILD_NATIVE --enable app_confbridge --disable app_fax --enable app_macro --enable codec_silk --enable format_mp3 --enable BETTER_BACKTRACES --disable FILE_STORAGE --enable ODBC_STORAGE --enable cdr_odbc --enable pbx_realtime\
        && make \
        && make install \
	    && make samples \
        && make config \
	    && cp -fra contrib/scripts/ast_tls_cert /usr/local/sbin/ast_tls_cert && mkdir -p /etc/asterisk/keys \
        && echo "asterisk -rvvvvvvvvvv" > /usr/local/sbin/a \
	    && chmod 777 -R /usr/local/sbin/ \
        && ldconfig \
	    && rm -fr /etc/asterisk/res_odbc.conf \
	    && rm -fr /etc/asterisk/manager.conf

#G729 Codecs
RUN  cd /usr/src \
        && wget https://github.com/BelledonneCommunications/bcg729/archive/refs/tags/1.0.4.tar.gz -O bcg729.tar.gz \
        && tar xfz bcg729.tar.gz \
        && cd /usr/src/bcg729-* \
        && ./autogen.sh \
        && ./configure --libdir=/usr/lib \
        && make \
        && make install \
        && rm -fr /usr/src/bcg729*

#G72X Codecs
RUN cd /usr/src \
        && git clone https://bitbucket.org/arkadi/asterisk-g72x.git \
        && cd /usr/src/asterisk-g72x \
        && ./autogen.sh \
        && ./configure --libdir=/usr/lib --with-bcg729 --enable-penryn \
        && make \
        && make install \
        && rm -fr /usr/src/asterisk-g72x

#Opus codecs
RUN cd /usr/src \
        && wget -O codec_opus.tar.gz http://downloads.digium.com/pub/telephony/codec_opus/asterisk-${Asterisk}.0/x86-64/codec_opus-${Asterisk}.0_current-x86_64.tar.gz \
        && tar -xvzf codec_opus.tar.gz \
        && rm -f codec_opus.tar.gz \
        && cd codec_opus-${Asterisk}* \
        && cp codec_opus.so /usr/lib/asterisk/modules \
        && cp format_ogg_opus.so /usr/lib/asterisk/modules \
        && cp codec_opus_config-en_US.xml /var/lib/asterisk/documentation/thirdparty \
        && rm -fr /usr/src/codec_opus*        


#############################################################################################################
#                                   Segunda etapa - Build Final
#############################################################################################################
FROM debian:buster-slim AS asterisk-nowebrtc

LABEL maintainer="Martin Lujan <mlujan@voipgroup.com>"

ENV  DEBIAN_FRONTEND=noninteractive

#Actualizo Repos y OS
RUN apt update 

RUN apt install -y --no-install-recommends --no-install-suggests \
        default-libmysqlclient-dev \
        dpkg-dev \
        freetds-dev \
        libbinutils \
        libcap2 \
        libcodec2-dev \
        libcurl4 \
        libedit-dev \
        libgmime-3.0-dev \
        libgsm1-dev \
        libical-dev \
        libiksemel-dev \
        libjansson-dev \
        libldap2-dev \
        libgtk2.0-0 \
        libncurses5-dev \
        libneon27-dev \
        libodbc1 \
        libosptk4 \
        libportaudio-ocaml-dev \
        libresample1-dev \
        libsnmp30 \
        libspandsp-dev \
        libspeexdsp-dev \
        libsqlite3-dev \
        libsrtp2-dev \
        libssl-dev \
        libunbound-dev \
        liburiparser-dev \ 
        libuuid1 \
        libvorbis-dev \
        libxml2-dev \
        libxslt-dev \
        nano \
        vim \
        net-tools \
        openssl \
        php \
        php-mysql \
        procps \
        supervisor \
        tzdata \
        unixodbc \
        unixodbc-dev \
        uuid-dev \
        wget \
        && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
        && rm /etc/odbc.ini 

### Conector ODBC
RUN cd / && wget --no-check-certificate https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-setup_8.0.22-1debian10_amd64.deb \
        https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-setup-dbgsym_8.0.22-1debian10_amd64.deb \
        https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc_8.0.22-1debian10_amd64.deb \
        https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-dbgsym_8.0.22-1debian10_amd64.deb \
        https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-community-client-plugins_8.0.23-1debian10_amd64.deb

RUN apt --fix-broken install

RUN dpkg -i mysql-community-client-plugins_8.0.23-1debian10_amd64.deb \
        && dpkg -i mysql-connector-odbc_8.0.22-1debian10_amd64.deb \
        && dpkg -i mysql-connector-odbc-dbgsym_8.0.22-1debian10_amd64.deb \
        && dpkg -i mysql-connector-odbc-setup_8.0.22-1debian10_amd64.deb\
        && dpkg -i mysql-connector-odbc-setup-dbgsym_8.0.22-1debian10_amd64.deb \
        && rm /etc/odbcinst.ini

### Usuario asterisk
RUN addgroup --gid 500 asterisk \
        && adduser --uid 500 --gid 500 --gecos "Asterisk User" --disabled-password asterisk 

#Copio los archivos de config y binarios compilados anteriormente
COPY ./config/ /etc

COPY --from=compiler --chown=asterisk:asterisk /usr/lib/libasterisk* /usr/lib/
COPY --from=compiler --chown=asterisk:asterisk /usr/lib/asterisk/ /usr/lib/asterisk/
COPY --from=compiler --chown=asterisk:asterisk /var/spool/asterisk/ /var/spool/asterisk/
COPY --from=compiler --chown=asterisk:asterisk /var/log/asterisk/ /var/log/asterisk/
COPY --from=compiler --chown=asterisk:asterisk /usr/sbin/asterisk /usr/sbin/asterisk
COPY --from=compiler --chown=asterisk:asterisk /etc/init.d/asterisk /etc/init.d/
COPY --from=compiler --chown=asterisk:asterisk /var/lib/asterisk/ /var/lib/asterisk/
COPY --from=compiler /usr/local/sbin/a /usr/local/sbin/a

#Copio los scripts de ejecucion
COPY ./AGI/ /var/lib/asterisk/agi-bin/

EXPOSE 5060 5061 5160 5161 10000-20000/udp 10000-20000/tcp

#automatic backup
VOLUME [ "/backup" ]

#asterisk etc
VOLUME [ "/etc/asterisk" ]
#asterisk sounds
VOLUME [ "/var/lib/asterisk/sounds" ]
#asterisk voicemail
VOLUME [ "/var/spool/asterisk/voicemail" ]
#asterisk monitor
VOLUME [ "/var/spool/asterisk/monitor" ]
#asterisk AGI
VOLUME ["/var/lib/asterisk/agi-bin/"]

#RUN DOCKER SCRIPT
COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

#mount
RUN cp -fra /etc/asterisk /etc/asterisk.org \
        && cp -fra /var/lib/asterisk/sounds /var/lib/asterisk/sounds.org \
        && cp -fra /var/spool/asterisk/voicemail /var/spool/asterisk/voicemail.org \
        && cp -fra /var/lib/asterisk/agi-bin /var/lib/asterisk/agi-bin.org

WORKDIR /etc/asterisk

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/asterisk", "-f", "-U", "asterisk", "-G", "asterisk"]
