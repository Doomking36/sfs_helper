#!/bin/csh

cd src

make -e -j$(nproc)
make NINITBIN=/bin install
make clean

ln -sf /bin/nhalt /bin/halt
ln -sf /bin/nhalt /bin/reboot
ln -sf /bin/ninit /bin/init

cd ../

cp ./initscripts/sfs/boot /etc/ninit/boot
cp ./initscripts/sfs/halt /etc/ninit/halt

mkdir -p /etc/ninit/scripts
mkdir -p /etc/ninit/services

cp ./initscripts/sfs/scripts/* /etc/ninit/scripts/
cp ./initscripts/sfs/services/* /etc/ninit/services/avail/

#activate services
#you can activate them by hand. list the servies
#in /etc/ninit/services/avail and activate each with
#sv -a service_name; or just iterate with csh
#on all of them, you can write a script for this
#if you think you will need to do this frequently.
#(aka: you're lazy)

#write by hand:
foreach s (/etc/ninit/services/avail/*)
   sv -a `basename $s`
end

#let's make sure the folder and its files have the right permissions.
chmod -R 700 /etc/ninit
