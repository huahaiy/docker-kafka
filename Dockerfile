#
# Run a Apache Kafka cluster 
#
# Version     0.1
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji.io>

RUN \
  echo "===> download kafka..."  && \ 
  wget -O /tmp/kafka.tgz \
    http://www.gtlib.gatech.edu/pub/apache/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz && \   
    \
    \
  echo "===> install kafka..."  && \ 
  tar xfz /tmp/kafka.tgz -C /opt && \
  \
  \
  echo "===> setup kafka..."  

ENV KAFKA_HOME /opt/kafka

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
