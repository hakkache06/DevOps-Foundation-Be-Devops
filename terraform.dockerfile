FROM alpine
MAINTAINER yhakkach <yassinhakkache@gmail.com>
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
RUN  cd /tmp && unzip terraform.zip && mv terraform /

USER nobody