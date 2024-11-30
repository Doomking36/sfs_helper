#!/bin/bash -e

mkdir -p                  \
      /mnt/proc           \
      /mnt/dev            \
      /mnt/sys            \
      /mnt/etc/ssl/certs  \
      /mnt/tmp            \
      /mnt/var/run        \
      /mnt/root           \
      /mnt/lib            \
      /mnt/include        \
      /mnt/bin            \
      /mnt/src            \
      /mnt/src/packages   \
      /mnt/src/sources

mount --bind /proc /mnt/proc
#mount --bind /dev /mnt/dev
mount --bind /sys /mnt/sys
mount --bind /etc/ssl/certs /mnt/etc/ssl/certs
mount --bind /tmp /mnt/tmp
mount --bind /var/run /mnt/var/run
mount --bind /lib /mnt/lib
mount --bind /bin /mnt/bin
