#
# Run Apache Kafka cluster in docker 
#
# Version     1.0
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

ARG kafka_version=1.0.0
ARG scala_version=2.12

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \ 
    PATH=${PATH}:${KAFKA_HOME}/bin

RUN \
  echo "===> download kafka..."  && \ 
  mkdir -p /opt/kafka && \
  wget -q -O - \
  http://apache.mirrors.hoobly.com/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | \
  tar -xzf - -C /opt/kafka --strip-components=1 && \   
  \
  \
  echo "===> setup kafka..."  


VOLUME ["/kafka"]

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
