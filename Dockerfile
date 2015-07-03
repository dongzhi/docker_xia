#
# Dockerfile for building my personal website
#

FROM node:latest
MAINTAINER Dongzhi Xia <xiatwo@gmail.com>

# install git
RUN apt-get update && apt-get install -y git git-core

# clone project and run
RUN \
    mkdir -p /usr/src/app \
    && cd /usr/src/app \
    && rm -rf dongzhi; true \
    && git clone https://github.com/dongzhi/dongzhi.git \
    && cd dongzhixia \
    && npm install \
    && node app.js

# set the working directory
WORKDIR /usr/src/app

EXPOSE 8888
