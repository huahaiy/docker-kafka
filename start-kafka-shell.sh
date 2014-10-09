#!/bin/bash
docker run -v /var/run/docker.sock:/var/run/docker.sock --link kafkadocker_zookeeper_1:zk -e HOST_IP=$1 -i -t huahaiy/kafka:latest /bin/bash

