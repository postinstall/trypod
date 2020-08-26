FROM centos:latest

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y \
                   telnet \
                   top \
                   stress \
                   stress-ng \
                   wget \
                   nmap-ncat \
                   npm \
                   net-tools \
                   less \
                   vim \
                   perl \
                   gawk \
                   sed \
                   du

WORKDIR /app

ADD loop.sh /app/loop.
ADD echoserver_8080.sh /app/echoserver_8080.sh
RUN npm install http-echo-server -g

#CMD ["/usr/bin/sh", "/app/loop.sh"]
CMD ["/usr/bin/sh", "/app/echoserver_8080.sh"]
