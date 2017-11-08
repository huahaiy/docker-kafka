#
# Run Apache Kafka cluster in docker 
#
# Version     0.9
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download kafka..."  && \ 
  wget -q -O - \
  http://apache.cs.utah.edu/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz | \
  tar -xzf - -C /opt && \   
  \
  \
  echo "===> setup kafka..."  

ENV KAFKA_HOME /opt/kafka_2.11-0.9.0.1

VOLUME ["/kafka"]

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
