FROM alpine:edge

EXPOSE 27017
VOLUME /data/db

RUN apk update \
 && apk upgrade \
 && apk add tini bash mongodb --no-cache \
 \
 && mkdir -p /data/db \
 && chown -R mongodb /data/db 

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["mongod","--bind_ip_all"]
