#
# Run Apache Kafka cluster in docker 
#
# Version     0.1
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download kafka..."  && \ 
  wget -q -O - \
  http://www.gtlib.gatech.edu/pub/apache/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz | \
  tar -xzf - -C /opt && \   
  \
  \
  echo "===> install docker..."  && \
  wget -O - https://get.docker.com/ | sh && \
  \
  \
  echo "===> setup kafka..."  

ENV KAFKA_HOME /opt/kafka_2.9.2-0.8.1.1

VOLUME ["/kafka"]

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
