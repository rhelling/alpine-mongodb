FROM alpine:edge

EXPOSE 27017
VOLUME /data/db
VOLUME /data/configdb

RUN apk update \
 && apk upgrade \
 && apk add tini bash mongodb --no-cache \
 \
 && mkdir -p /data/db \
 && chown -R mongodb /data/db /data/configdb

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["mongod","--bind_ip_all"]
