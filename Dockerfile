FROM alpine:latest
MAINTAINER jckimble <jckimble@thorbis.com>

WORKDIR /app
COPY startup.sh /startup.sh

RUN apk add --update pdns pdns-backend-mysql && rm -f /var/cache/apk/* && chmod +x /startup.sh
COPY pdns.conf /app/pdns.conf
ADD https://github.com/thorbis-hosting/ParseConfig/releases/download/v0.1/ParseConfig /usr/local/bin/
RUN chmod +x /startup.sh /usr/local/bin/ParseConfig

EXPOSE 53
CMD ["/startup.sh"]
