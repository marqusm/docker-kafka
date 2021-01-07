# docker-kafka

## Motivation
The purpose of this Docker image is to create Kafka image in simple, plain way,
so that it can be easier to understand what is going on inside.

As of now, it supports only limited number of parameters.
That's something to be expanded in the future.

## How to build an image
To build a Docker image, please run the following command being in a root folder: \
`docker build -t kafka:latest .`

## Supported environment variables

**KAFKA_BROKER_ID** \
Broker identifier. \
Example: \
`1`

**KAFKA_LISTENERS** \
Listeners addresses. Comma separated values. \
Example: \
`INTERNAL://0.0.0.0:9093,EXTERNAL://0.0.0.0:9092`

**KAFKA_LISTENER_SECURITY_PROTOCOL_MAP** \
Listeners security protocols. Comma separated values. \
Example: \
`EXTERNAL:PLAINTEXT,INTERNAL:PLAINTEXT`

**KAFKA_ADVERTISED_LISTENERS** \
Listeners advertised listeners addresses. Comma separated values. \
Example: \
`INTERNAL://<HOST_ADDRESS>:9093,EXTERNAL://<HOST_ADDRESS>:9092`

**KAFKA_ZOOKEEPER_CONNECT** \
Zookeeper address. \
Example: \
`zookeeper:2181`
