FROM jenkins:alpine

USER root
RUN apk --update add docker py-pip && pip install docker-compose

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ADD job-dsl /var/job-dsl
ADD init.groovy.d/create-seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/00-create-seed-job.groovy

