FROM ubuntu:latest

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    telnet \
    htop \
    mc \
    less \
    vim \
    perl \
    gawk \
    sed \
    nodejs \
    npm \
    stress \
    stress-ng \
    dnsutils \
    net-tools \
    traceroute

#RUN yum install -y \
#                   telnet \
#                   top \
#                   stress \
#                   stress-ng \
#                   wget \
#                   nmap-ncat \
#                   npm \
#                   net-tools \
#                   less \
#                   vim \
#                   perl \
#                   gawk \
#                   sed \
#                   du

WORKDIR /app

ADD loop.sh /app/loop.sh
ADD echoserver_8080.sh /app/echoserver_8080.sh
RUN npm install http-echo-server -g

#CMD ["/usr/bin/sh", "/app/loop.sh"]
CMD ["/usr/bin/sh", "/app/echoserver_8080.sh"]
