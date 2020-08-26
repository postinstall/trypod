FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    telnet \
    htop \
    mc \
    less \
    vim \
    perl \
    gawk \
    sed 

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
