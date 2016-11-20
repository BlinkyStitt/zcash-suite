#!/bin/sh

RPC_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c24)

sed -i -e "s/^rpcpassword=.*/rpcpassword=${RPC_PASSWORD}/" config/mainnet.conf
sed -i -e "s/^rpcpassword=.*/rpcpassword=${RPC_PASSWORD}/" config/testnet.conf
