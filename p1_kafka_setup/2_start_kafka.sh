#!/bin/sh

# Location where Kafka is installed.
KAFKA_HOME=~/apps/kafka

# Start Kafka server.
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
