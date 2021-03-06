FROM alpine:3.5 as build

ENV HUGO_VERSION 0.72.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

# Certificates
RUN apk update \
        && apk upgrade \
        && apk add --no-cache ca-certificates \
        && update-ca-certificates

# Install Hugo
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin