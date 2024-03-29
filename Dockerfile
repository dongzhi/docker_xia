#
# Dockerfile for building my personal website
#

# Set the base image to Ubuntu
FROM ubuntu:latest

MAINTAINER Dongzhi Xia <xiatwo@gmail.com>

# install git
RUN apt-get update && \
    apt-get install -y git git-core && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -y install python build-essential nodejs

# clone project and run
RUN \
    mkdir -p /usr/src/app \
    && cd /usr/src/app \
    && rm -rf dongzhi; true \
    && git clone -b gh-pages https://github.com/dongzhi/dongzhi.git \
    && cd dongzhi \
    && npm install

# set the working directory
WORKDIR /usr/src/app/dongzhi
VOLUME /usr/src/app/dongzhi

EXPOSE 8888

CMD ["node", "app.js"]
