#
# Run Apache Kafka cluster in docker 
#
# Version     0.7
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download kafka..."  && \ 
  wget -q -O - \
  http://apache.mirrors.tds.net/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz | \
  tar -xzf - -C /opt && \   
  \
  \
  echo "===> setup kafka..."  

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.2

VOLUME ["/kafka"]

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
