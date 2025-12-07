# Using apline linux image as base for the small size
FROM docker.io/alpine:latest

# Well, this is me...
MAINTAINER Dwedia

USER root

RUN apk add --no-cache git ansible kubectl vim bash curl openssl ca-certificates && rm -rf /var/cache/apk/*

RUN curl -sL https://talos.dev/install | sh

RUN mkdir -p /kubecontrol/configs

#ENV KUBECONFIG=/kubecontrol/configs/kubeconfig
#ENV TALOSCONFIG=/kubecontrol/configs/talosconfig

COPY files/.bashrc /root/.bashrc

WORKDIR /kubecontrol

STOPSIGNAL sigkill

#ENTRYPOINT ["/kubecontrol/configs/entrypoint.sh"]
ENTRYPOINT ["/bin/bash"]
