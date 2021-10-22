FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update && apt-get -y upgrade && \
        apt-get -y install --no-install-recommends && \
        apt-get -y install locales python3 python3-lxml python3-pip \
        libc-ares-dev libcrypto++-dev libcurl4-openssl-dev \
        libmagic-dev libsodium-dev libsqlite3-dev libssl-dev \
        aria2 curl ffmpeg jq p7zip-full p7zip-rar pv

# Installing MegaRest Python Binding
RUN curl -fsSL https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest \
    && chmod +x /usr/local/bin/megasdkrest

# Cleanup environment
RUN apt-get -qq -y autoremove --purge \
    && apt-get -qq -y clean \
    && rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/* /etc/apt/sources.list.d/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
