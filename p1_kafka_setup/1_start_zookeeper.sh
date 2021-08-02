#!/bin/sh

# Location where Kafka is installed.
KAFKA_HOME=~/apps/kafka

# Start Zookeeper server.
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
