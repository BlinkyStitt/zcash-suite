#!/bin/sh
# add dynamic things to the user-customizable config

set -e

# zcashd does not support name resolution for the proxy setting so we get the
# IP for the Tor container now
TOR_PROXY_IP=$(getent hosts tor | cut -f1 -d' ')
if [ -z "$TOR_PROXY_IP" ]; then
    echo "Cannot start zcashd until Tor is running."
    exit 1
fi

cp /config/zcash.conf ~/.zcash/

# TODO: add a note to the top of the copied config that they shouldn't touch it

sed -i -e "/^proxy=/ s/=.*/=${TOR_PROXY_IP}:9050/" ~/.zcash/zcash.conf
sed -i -e "/^onion=/ s/=.*/=${TOR_PROXY_IP}:9050/" ~/.zcash/zcash.conf

zcash-fetch-params

exec zcashd -printtoconsole "$@"
