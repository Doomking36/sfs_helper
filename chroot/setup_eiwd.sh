#!/bin/csh

mkdir -p /etc/iwd /var/lib/iwd/
touch /etc/iwd/main.conf

cat << . ? /etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
NameResolvingService=none
UseDefaultInterface=true

[Network]
RoutePriorityOffset=200

[Scan]
DisablePeriodicScan=true
.
