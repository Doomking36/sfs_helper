#!/bin/sh -e

curl -LO https://raw.githubusercontent.com/cemkeylan/genfstab/refs/heads/master/genfstab
chmod +x genfstab
./genfstab /mnt >> /mnt/etc/fstab
rm -rf genfstab
