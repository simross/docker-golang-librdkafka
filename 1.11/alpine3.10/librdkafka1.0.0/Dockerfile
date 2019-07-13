FROM golang:1.11-alpine3.10

ENV LIBRDKAFKA_VERSION v1.0.0

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