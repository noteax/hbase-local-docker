#!/usr/bin/env bash

bin=`dirname "${BASH_SOURCE-$0}"`
bin=`cd "$bin">/dev/null; pwd`

. "$bin"/hbase-config.sh
. "$bin"/hbase-common.sh

command=$1
shift

# Some variables
# Work out java location so can print version into log.
if [ "$JAVA_HOME" != "" ]; then
  #echo "run java in $JAVA_HOME"
  JAVA_HOME=$JAVA_HOME
fi
if [ "$JAVA_HOME" = "" ]; then
  echo "Error: JAVA_HOME is not set."
  exit 1
fi
JAVA=$JAVA_HOME/bin/java

#
# Relaunch command if failed
# 

RET=0
while [ $RET -ne 130 ]
  do
    lastLaunchDate=`date +%s`
    
    "$HBASE_HOME"/bin/hbase --config "${HBASE_CONF_DIR}" $command "$@" start
    RET=$?

    #if the cluster is being stopped then do not restart it again.
    zparent=`$bin/hbase org.apache.hadoop.hbase.util.HBaseConfTool zookeeper.znode.parent`
    if [ "$zparent" == "null" ]; then zparent="/hbase"; fi
    zkrunning=`$bin/hbase org.apache.hadoop.hbase.util.HBaseConfTool zookeeper.znode.state`
    if [ "$zkrunning" == "null" ]; then zkrunning="running"; fi
    zkFullRunning=$zparent/$zkrunning
    $bin/hbase zkcli stat $zkFullRunning 2>&1 | grep "Node does not exist"  1>/dev/null 2>&1
    #grep returns 0 if it found something, 1 otherwise
    if [ $? -eq 0 ]; then
      exit 1
    fi
    #If ZooKeeper cannot be found, then do not restart
    $bin/hbase zkcli stat $zkFullRunning 2>&1 | grep Exception | grep ConnectionLoss  1>/dev/null 2>&1
    if [ $? -eq 0 ]; then
      exit 1
    fi
    #if it was launched less than 15 seconds ago, then wait for 15 seconds before starting it again.
    curDate=`date +%s`
    limitDate=`expr $lastLaunchDate + 15`
    if [ $limitDate -gt $curDate ]; then
      echo "Sleeping 15 seconds before RESTART"
      sleep 15
    fi
done