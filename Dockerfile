FROM alpine:3.9

RUN set -ex \
    && apk add --no-cache ca-certificates \
    jq \
    bash \
    curl

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
