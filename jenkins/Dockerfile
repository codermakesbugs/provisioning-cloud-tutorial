FROM ubuntu:latest

USER root

# Install necessary tools
COPY install-tools.sh /tmp/
RUN bash /tmp/install-tools.sh

# Expose docker port 22
EXPOSE 22

ENTRYPOINT service ssh restart && bash

# change workdir
WORKDIR /home/jenkins
