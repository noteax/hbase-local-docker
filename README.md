# hbase-local-docker
This is the simplified version of HBase for development purposes that uses the local filesystem instead of HDFS. External Zookeeper required for this image, see [image](https://hub.docker.com/_/zookeeper/).

# Supported tags and respective `Dockerfile` links

* `1.2.6`[(1.2.6/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.6/Dockerfile)
* `1.3.0`[(1.3.0/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.0/Dockerfile)
* `1.3.1`, `latest` [(1.3.1/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.1/Dockerfile)

# What is Apache HBase?

Apache HBase™ is the Hadoop database, a distributed, scalable, big data store.

Use Apache HBase™ when you need random, realtime read/write access to your Big Data. This project's goal is the hosting of very large tables -- billions of rows X millions of columns -- atop clusters of commodity hardware. Apache HBase is an open-source, distributed, versioned, non-relational database modeled after Google's Bigtable: A Distributed Storage System for Structured Data by Chang et al. Just as Bigtable leverages the distributed data storage provided by the Google File System, Apache HBase provides Bigtable-like capabilities on top of Hadoop and HDFS.

# How to use this image

## Environment variables:

 ## Master
  - MASTER_HOSTNAME - master hostname advise, should match with container name
  - ZOOKEEPER_QUORUM - zookeeper quorum
 ## Regionserver
  - REGIONSERVER_HOSTNAME - regionserver hostname advise, should match with container name
  - ZOOKEEPER_QUORUM - zookeeper quorum

## Example

You could use preconfigured master/regionserver/zookeeper example:

	$ docker-compose up

## Where to store data

Both master/regionserver use `/data` folder to store data, make sure that both paths mapped as volumes into single shared directory.
