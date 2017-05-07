FROM ubuntu

MAINTAINER aspgems

RUN apt-get update && apt-get install -y git git-core openssl

RUN mkdir /root/.ssh && echo "StrictHostKeyChecking no" > /root/.ssh/config

RUN mkdir /work

WORKDIR /work
