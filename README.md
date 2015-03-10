docker-kafka
============

Run a multi-node Apache Kafka cluster in a set of docker containers.

`/kafka` is exposed as the data directory, to be linked to a host directory.

Environment variables starting with `KAFKA_` will be converted into proper Kafka configuration options, e.g. `KAFKA_MESSAGE_MAX_BYTES` will be converted to `message.max.bytes`. 

The following environment variables are good to know.

* `KAFKA_ADVERTISED_HOST_NAME` This is required to be the IP address of the host. If using boot2docker on OSX, it's the docker host address 192.168.59.103.

* `KAFKA_ADVERTISED_PORT` If running the cluster on a single host (e.g. for dev/test purposes), you can leave this unspecified, so that the docker containers' internal mapped ports can be used.

* `KAFKA_BROKER_ID` If unspecified, the advertised port number will be used. 

* `KAFKA_LOG_DIRS` If unspecified, default will be `/kafka/kafka-logs-$KAFKA_BROKER_ID`

* `KAFKA_ZOOKEEPER_CONNECT` If unspecified, default will be comman separated IP addresses in environment varibles matching `ZK.*PORT_2181_TCP`, which you will have if some zookeeper containers are linked to this container (e.g. using fig).

* `KAFKA_HEAP_OPTS` 

