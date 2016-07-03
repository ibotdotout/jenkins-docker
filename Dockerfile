FROM jenkins:alpine

USER root
RUN apk --update add docker py-pip && pip install docker-compose

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
