docker-kafka
============

Run Apache Kafka cluster in docker containers and support multi-node cluster.

`/kafka` is exposed as the data directory, to be linked to a host directory.

Environment variables starting with `KAFKA_` will be converted into proper Kafka configuration options, e.g. `KAFKA_MESSAGE_MAX_BYTES` will be converted to `message.max.bytes`. 

The following environment variables are good to know.

* `KAFKA_ADVERTISED_HOST_NAME` This is required 

* `KAFKA_ADVERTISED_PORT` If running the cluster on a single host (e.g. for dev/test purposes), you can leave this unspecified, so that the docker containers' internal mapped ports can be used.

* `KAFKA_BROKER_ID` If unspecified, the advertised port number will be used. 

* `KAFKA_LOG_DIRS` If unspecified, default will be `/kafka/kafka-logs-$KAFKA_BROKER_ID`

* `KAFKA_ZOOKEEPER_CONNECT` If unspecified, default will be comma separated IP addresses in environment varibles matching `ZK.*PORT_2181_TCP`, which you will have if some zookeeper containers are properly linked to this container (e.g. using fig and name the linked zookeeper `zk`).

* `KAFKA_HEAP_OPTS` 

