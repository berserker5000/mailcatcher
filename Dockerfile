FROM alpine:3.7
MAINTAINER dmkul <dmkul@ciklum.com>
RUN apk add --no-cache ca-certificates openssl
RUN apk add --no-cache ruby ruby-bigdecimal ruby-json sqlite-libs libstdc++
ARG MAILCATCHER_VERSION=0.6.5
RUN apk add --no-cache --virtual .build-deps \
        ruby-dev \
        make g++ \
        sqlite-dev \
        && \
    gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc && \
    apk del .build-deps
EXPOSE 1025 1080
CMD ["mailcatcher", "--no-quit", "--foreground", "--ip=0.0.0.0"]
