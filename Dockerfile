FROM alpine:latest

EXPOSE 27017
VOLUME /data/db

RUN apk update \
 && apk upgrade \
 && apk add tini bash mongodb mongodb-tools openssh-client --no-cache \
 \
 && mkdir -p /data/db \
 && chown -R mongodb /data/db 

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["mongod","--bind_ip_all"]
