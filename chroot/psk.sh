#!/bin/csh

cat << . > /var/lib/iwd/YourSSID.psk
[Security]
Passphrase=YourPassphrase
.
