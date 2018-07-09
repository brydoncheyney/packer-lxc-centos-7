FROM ubuntu:latest

RUN apt-get update; apt-get install --yes yum sudo iproute2 openssl lxc lxc-templates

COPY packer /usr/local/bin/packer

VOLUME /packer
ENTRYPOINT ["./packer/build"]
