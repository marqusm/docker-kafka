# docker-kafka

## Motivation
The purpose of this Docker image is to create Kafka image in simple, plain way,
so that it can be easier to understand what is going on inside.

As of now, it supports only limited number of parameters.
That's something to be expanded in the future.

## How to build an image
To build a Docker image, please run the following command being in a root folder: \
`docker build -t kafka:latest .`

## Using with docker-compose
Here is the example of docker-compose.yaml of zookeeper and kafka together.
Keep in mind entering HOST_IP address.
```
version: "3"

services:
  zookeeper:
    image: zookeeper:latest
    container_name: zookeeper
    restart: unless-stopped
    networks:
      - network
    ports:
      - 2181:2181
      - 2888:2888
      - 3888:3888
    volumes:
      - ./zookeeper/data:/tmp/zookeeper
    environment:
      ZOO_ID: 1
      ZOO_PORT: 2181

  kafka_1:
    image: kafka:latest
    container_name: kafka_1
    restart: unless-stopped
    networks:
      - network
    ports:
      - 9092:9092
      - 9093:9093
    volumes:
      - ./kafka/data:/tmp/kafka-logs
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_ADVERTISED_LISTENERS: INTERNAL://<HOST_IP>:9093,EXTERNAL://<HOST_IP>:9092
      KAFKA_LISTENERS: INTERNAL://0.0.0.0:9093,EXTERNAL://0.0.0.0:9092
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: EXTERNAL:PLAINTEXT,INTERNAL:PLAINTEXT
    depends_on:
      - zookeeper

networks:
  network:
    name: network
```

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
`INTERNAL://<HOST_IP>:9093,EXTERNAL://<HOST_IP>:9092`

**KAFKA_ZOOKEEPER_CONNECT** \
Zookeeper address. \
Example: \
`zookeeper:2181`
