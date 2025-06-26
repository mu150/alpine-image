# Dockerfile
# syntax=docker/dockerfile:experimental

FROM alpine:3.22

# install LTS kernel, firmware, mkinitfs and build initramfs
RUN apk update \
 && apk add --no-cache linux-lts linux-firmware mkinitfs busybox \
 && mkinitfs -b /boot

CMD ["uname", "-a"]
