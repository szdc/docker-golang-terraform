FROM golang:1.9-alpine

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update git bash openssh zip unzip

# Install terraform
ENV TERRAFORM_VERSION=0.11.3
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip /tmp/terraform.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/ && rm /tmp/terraform.zip

# Install gometalinter
RUN go get -u gopkg.in/alecthomas/gometalinter.v2 && gometalinter.v2 --install

WORKDIR $GOPATH

