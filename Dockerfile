ARG GOLANG_VERSION=1.14
ARG ALPINE_VERSION=3.11
FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION}

ARG LIBRDKAFKA_VERSION=1.2.2
ENV LIBRDKAFKA_VERSION v${LIBRDKAFKA_VERSION}

RUN apk add --no-cache --virtual .fetch-deps git bash

RUN apk add --no-cache \
    bash \
    openssl-dev \
    musl-dev \
    build-base \
    zlib-dev

RUN cd /tmp \
    && git clone --branch ${LIBRDKAFKA_VERSION} https://github.com/edenhill/librdkafka.git \
    && cd /tmp/librdkafka \
    && ./configure --prefix /usr \
    && make \
    && make install \
    && cd \
    && rm -rf /tmp/librdkafka

RUN apk del .fetch-deps