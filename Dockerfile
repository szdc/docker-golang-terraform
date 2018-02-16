FROM golang:1.9-alpine

ENV DEBIAN_FRONTEND noninteractive

# Install terraform
ENV TERRAFORM_VERSION=0.11.3

RUN apk add --update git bash openssh zip

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR $GOPATH

