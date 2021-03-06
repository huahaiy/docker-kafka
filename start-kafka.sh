#!/bin/bash

set -e

mkdir -p "/kafka"

if [[ -z "$KAFKA_ADVERTISED_PORT" ]]; then
  export KAFKA_ADVERTISED_PORT=9092
fi

if [[ -z "$KAFKA_BROKER_ID" ]]; then
  export KAFKA_BROKER_ID=0
fi

if [[ -z "$KAFKA_LOG_DIRS" ]]; then
  export KAFKA_LOG_DIRS="/kafka/kafka-logs-$KAFKA_BROKER_ID"
fi

if [[ -z "$KAFKA_ZOOKEEPER_CONNECT" ]]; then
  export KAFKA_ZOOKEEPER_CONNECT=zookeeper
fi

if [[ -n "$KAFKA_HEAP_OPTS" ]]; then
  sed -r -i "s/^(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"$KAFKA_HEAP_OPTS\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
  unset KAFKA_HEAP_OPTS
fi

for VAR in `env`
do
  if [[ $VAR =~ ^KAFKA_ && ! $VAR =~ ^KAFKA_HOME ]]; then
    kafka_name=`echo "$VAR" | sed -r "s/KAFKA_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
    env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
    if egrep -q "(^|^#)$kafka_name=" $KAFKA_HOME/config/server.properties; then
      sed -r -i "s@(^|^#)($kafka_name)=(.*)@\2=${!env_var}@g" $KAFKA_HOME/config/server.properties 
    else
      printf "\n" >> $KAFKA_HOME/config/server.properties
      echo "$kafka_name=${!env_var}" >> $KAFKA_HOME/config/server.properties
    fi
  fi
done

cat $KAFKA_HOME/config/server.properties

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
