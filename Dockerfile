# syntax=docker/dockerfile:experimental
FROM alpine:3.22

# install the LTS kernel and tools (incl. firmware)
RUN apk update \
 && apk add --no-cache linux-lts initramfs busybox

# (Optional) build your initramfs here, e.g.:
# RUN mkinitfs -c /etc/mkinitfs/mkinitfs.conf -b /boot

CMD ["uname","-a"]
