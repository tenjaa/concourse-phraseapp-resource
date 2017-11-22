FROM alpine

RUN set -ex \
    && apk add --no-cache ca-certificates \
    jq \
    bash \
    curl
