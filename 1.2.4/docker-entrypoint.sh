#!/bin/bash

set -e

# Generate the config only if it doesn't exist
if [ ! -f "conf/hbase-site.xml" ]; then
    CONFIG="conf/hbase-site.xml"

    echo "<?xml version=\"1.0\"?>" >> $CONFIG
    echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> $CONFIG
    echo "<configuration>" >> $CONFIG
    echo "<property><name>hbase.rootdir</name><value>file://$HBASE_DATA_DIR/hbase</value></property>" >> $CONFIG
    echo "<property><name>hbase.zookeeper.quorum</name><value>$ZOOKEEPER_QUORUM</value></property>" >> $CONFIG
    echo "</configuration>" >> $CONFIG

fi

exec "$@"