#!/bin/sh -e

curl -f https://curl.se/ca/cacert.pem -o /mnt/etc/ssl/certs/ca-certificates.crt
