#!/bin/sh

# Location where Kafka is installed.
KAFKA_HOME=~/apps/kafka

# Start a Kafka consumer just for testing purposes.
$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic OrderReceived --from-beginning

