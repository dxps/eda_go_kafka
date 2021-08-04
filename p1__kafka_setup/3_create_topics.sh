#!/bin/sh

# Location where Kafka is installed.
KAFKA_HOME=~/apps/kafka

# Create the OrderReceived topic.
$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=10800000 --topic OrderReceived

# Create the OrderConfirmed topic.
$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=10800000 --topic OrderConfirmed

# Create the OrderPickedAndPacked topic.
$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=10800000 --topic OrderPickedAndPacked

# Create the Notification topic.
$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=10800000 --topic Notification

# Create the DeadLetterQueue topic.
$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=10800000 --topic DeadLetterQueue

# Modify OrderReceived topic by increasing its retention time to three days.
$KAFKA_HOME/bin/kafka-configs.sh --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name OrderReceived --add-config retention.ms=259200000

# Notes:
# 1. Any such topic can be verified for existence using, for example:
#    $KAFKA_HOME/bin/kafka-topics.sh --describe --topic OrderReceived --bootstrap-server localhost:9092
