FROM openjdk:8-jre-alpine
MAINTAINER Aidar Bariev <aidarbariev@gmail.com>

RUN apk add --no-cache \
    bash \
    su-exec

ENV HBASE_DATA_DIR=/data
ENV ZOOKEEPER_QUORUM=zookeeper-host:2181
ENV HBASE_MANAGES_ZK=false

ARG VERSION=1.3.0
ARG HBASE_NAME=hbase-$VERSION
ARG DISTRO_NAME=$HBASE_NAME-bin

RUN set -x \
    && apk --no-cache add openssl \
    && wget -q "https://archive.apache.org/dist/hbase/$VERSION/$DISTRO_NAME.tar.gz" \
    && tar -xzf "$DISTRO_NAME.tar.gz" \
    && rm -r "$DISTRO_NAME.tar.gz" \
    && rm $HBASE_NAME/conf/hbase-site.xml \
    && apk del openssl

WORKDIR $HBASE_NAME
VOLUME ["$HBASE_DATA_DIR"]

EXPOSE 60000 60010

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bin/hbase", "master", "start"]