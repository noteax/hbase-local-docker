FROM openjdk:8-jre-alpine
MAINTAINER Aidar Bariev <aidarbariev@gmail.com>

RUN apk add --no-cache \
    bash \
    su-exec

ENV HBASE_DATA_DIR=/data
    
ARG VERSION=1.3.1
ARG HBASE_NAME=hbase-$VERSION
ARG DISTRO_NAME=$HBASE_NAME-bin

RUN set -x \
    && wget -q "http://www.apache.org/dist/hbase/$VERSION/$DISTRO_NAME.tar.gz" \
    && tar -xzf "$DISTRO_NAME.tar.gz" \
    && rm -r "$DISTRO_NAME.tar.gz" \
    && rm $HBASE_NAME/conf/hbase-site.xml

WORKDIR $HBASE_NAME
VOLUME ["$HBASE_DATA_DIR"]

EXPOSE 60000 60010

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bin/hbase", "master", "start"]