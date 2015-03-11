#
# Run Apache Kafka cluster in docker 
#
# Version     0.4
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download kafka..."  && \ 
  wget -q -O - \
  http://www.trieuvan.com/apache/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz | \
  tar -xzf - -C /opt && \   
  \
  \
  echo "===> install docker..."  && \
  echo "deb http://http.debian.net/debian wheezy-backports main" | tee \
    /etc/apt/sources.list.d/wheezy-backports.list && \
  apt-get update && \
  apt-get install -t wheezy-backports linux-image-amd64 && \
  wget -O - https://get.docker.com/ | sh && \
  \
  \
  echo "===> setup kafka..."  

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.0

VOLUME ["/kafka"]

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh

CMD start-kafka.sh
