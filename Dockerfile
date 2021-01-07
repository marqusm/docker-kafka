FROM openjdk:11-jre-buster

RUN \
	cd /root \
	&& wget https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz \
	&& tar -xzf kafka_2.13-2.7.0.tgz \
	&& mv kafka_2.13-2.7.0 /opt/kafka

WORKDIR /opt/kafka

ENTRYPOINT \
	   sed -i "s|broker.id=.*|broker.id=${KAFKA_BROKER_ID}|g" config/server.properties \
	&& sed -i "s|#listeners=.*|listeners=${KAFKA_LISTENERS}|g" config/server.properties \
	&& sed -i "s|#listener.security.protocol.map=.*|listener.security.protocol.map=${KAFKA_LISTENER_SECURITY_PROTOCOL_MAP}|g" config/server.properties \
	&& sed -i "s|#advertised.listeners=.*|advertised.listeners=${KAFKA_ADVERTISED_LISTENERS}|g" config/server.properties \
	&& sed -i "s|zookeeper.connect=.*|zookeeper.connect=${KAFKA_ZOOKEEPER_CONNECT}|g" config/server.properties \
	&& echo 'inter.broker.listener.name=INTERNAL' >> config/server.properties \
	&& bin/kafka-server-start.sh config/server.properties
