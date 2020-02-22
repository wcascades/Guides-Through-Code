#!/bin/bash
SBHOSTS=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
BHOUTFILE=blackhole.zone
wget $SBHOSTS -O .tempHosts

# setting up header of blackhole file
echo "server: " > $BHOUTFILE

sed -e 's/0.0.0.0/local-zone:/' -e '1,/^# http:\/\/stevenblack.com$/d' -e '/^$/d' .tempHosts | awk '{print "\011" $1 " " "\x22" $2 "\x22" " always_nxdomain"}' >> $BHOUTFILE
# clean up temp files
rm .tempHosts
