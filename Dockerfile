FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

COPY entry.sh /usr/local/bin/entry.sh
COPY plexmediaserver_1.3.3.3148-b38628e_amd64.deb /tmp/

RUN apt-get update && \
    dpkg -i /tmp/plexmediaserver_1.3.3.3148-b38628e_amd64.deb && \
    rm /tmp/plexmediaserver_1.3.3.3148-b38628e_amd64.deb && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/*

EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp

VOLUME /var/lib/plexmediaserver:plexdata

ENTRYPOINT /usr/local/bin/entry.sh
