# hbase-local-docker
This is the simplified version of HBase for development purposes that uses the local filesystem. External Zookeeper required for this image, see [image](https://hub.docker.com/_/zookeeper/).

# Supported tags and respective `Dockerfile` links

* `1.2.6`[(1.2.6/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.6/Dockerfile)
* `1.3.0`[(1.3.0/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.0/Dockerfile)
* `1.3.1`, `latest` [(1.3.1/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.1/Dockerfile)

# What is Apache HBase?

Apache HBase™ is the Hadoop database, a distributed, scalable, big data store.

Use Apache HBase™ when you need random, realtime read/write access to your Big Data. This project's goal is the hosting of very large tables -- billions of rows X millions of columns -- atop clusters of commodity hardware. Apache HBase is an open-source, distributed, versioned, non-relational database modeled after Google's Bigtable: A Distributed Storage System for Structured Data by Chang et al. Just as Bigtable leverages the distributed data storage provided by the Google File System, Apache HBase provides Bigtable-like capabilities on top of Hadoop and HDFS.

# How to use this image

## Environment variables:

 * ZOOKEEPER_QUORUM zookeeper quorum to connect (def. zookeeper-quorum:2181)
 * MASTER_PORT master port of hbase (def. 16000)
 * REGIONSERVER_PORT region port (def. 16020)

## Configuration

Both master and region server requires -h hostname advise (or hostname: in docker-compose) to bind together through zookeeper. See included docker-compose file.

	$ docker-compose up

## Where to store data

This image is configured with volume at `/data` to hold the HBase files.
