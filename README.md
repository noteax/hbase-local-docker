# hbase-standalone
This is the simplified version of HBase for development purposes that uses the local filesystem. External Zookeeper required for this image, see [image](https://hub.docker.com/_/zookeeper/).

# Supported tags and respective `Dockerfile` links

* `1.2.3`[(1.2.3/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.3/Dockerfile)
* `1.2.4`[(1.2.4/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.4/Dockerfile)
* `1.2.5`[(1.2.5/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.5/Dockerfile)
* `1.2.6`[(1.2.6/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.2.6/Dockerfile)
* `1.3.0`[(1.3.0/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.0/Dockerfile)
* `1.3.1`, `latest` [(1.3.1/Dockerfile)](https://github.com/noteax/hbase-standalone/blob/master/1.3.1./Dockerfile)

# What is Apache HBase?

Apache HBase™ is the Hadoop database, a distributed, scalable, big data store.

Use Apache HBase™ when you need random, realtime read/write access to your Big Data. This project's goal is the hosting of very large tables -- billions of rows X millions of columns -- atop clusters of commodity hardware. Apache HBase is an open-source, distributed, versioned, non-relational database modeled after Google's Bigtable: A Distributed Storage System for Structured Data by Chang et al. Just as Bigtable leverages the distributed data storage provided by the Google File System, Apache HBase provides Bigtable-like capabilities on top of Hadoop and HDFS.

# How to use this image

Required configurations:
 -h hostname - parameter to advise master hostname (or 'hostname:' for docker-compose)
 ZOOKEEPER_QUORUM - environment variable to configure quorum to connect

## Start a Hbase server instance

	$ docker run -p 2181:2181 zookeeper
	$ docker run -e "ZOOKEEPER_QUORUM=localhost:2181" -h localhost --name some-hbase -d noteax/hbase-standalone

## Connect to HBase from an application in another Docker container

	$ docker run --name some-app --link some-hbase:hbase -d application-that-uses-hbase

## Connect to HBase container with line client

	$ docker exec -it some-hbase bin/hbase shell

## Where to store data

This image is configured with volume at `/data` to hold the HBase files.
