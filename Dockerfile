FROM ubuntu:15.04
MAINTAINER cliffrowley@gmail.com

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
    apt-utils \
    ca-certificates \
    lib32gcc1 \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl

ADD ./steam /steam

WORKDIR /steam

RUN useradd steam && \
    mkdir -p /steam/app && \
    mkdir -p /steam/steamcmd && \
    chown -R steam:steam /steam

USER steam

ENV STEAMCMD_URL="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
    STEAMCMD_DIR="/steam/steamcmd" \
    STEAM_APP_DIR="/steam/app"

CMD /steam/init.sh
