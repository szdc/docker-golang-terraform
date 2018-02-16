FROM golang:1.9-alpine

ENV DEBIAN_FRONTEND noninteractive

# Install terraform
ENV TERRAFORM_VERSION=0.11.3

RUN apk add --update git bash openssh zip unzip

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip /tmp/terraform.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/ && rm /tmp/terraform.zip

#WORKDIR $GOPATH/src/github.com/hashicorp/terraform
#RUN git clone https://github.com/hashicorp/terraform.git ./ && \
#    git checkout v${TERRAFORM_VERSION} && \
#    /bin/bash scripts/build.sh

WORKDIR $GOPATH

