# File: Dockerfile
# syntax = docker/dockerfile:1.4

# FROM alpine:3.22
#RUN set -eux; \
#    apk update; \
#    apk add --no-cache linux-lts linux-firmware mkinitfs busybox; \
#    mkdir -p /boot; \
#    # detect the only modules dir we have and pass it to mkinitfs:
#    KVER="$(ls /lib/modules)"; \
#    mkinitfs -k "$KVER"

FROM alpine:edge
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main'     > /etc/apk/repositories \
 && echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
 && apk update \
 && apk add --no-cache linux-edge linux-firmware mkinitfs busybox \
 && KVER=$(ls /lib/modules) \
 && mkinitfs -k "$KVER"

CMD ["uname", "-a"]
