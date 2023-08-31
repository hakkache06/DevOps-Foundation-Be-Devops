FROM jenkins/jenkins:alpine
MAINTAINER yhakkach <hakkacheyassin@gmail.com>

COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/install-plugins.sh  < /usr/share/jenkins/plugins.txt

