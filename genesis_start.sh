#!/bin/bash
DATADIR=$HOME/eos/eos_data
if [ ! -d $DATADIR ]; 
then
  mkdir -p $DATADIR;
fi
nodeos \
	--plugin eosio::chain_plugin \
	--plugin eosio::chain_api_plugin \
	--plugin eosio::http_plugin \
	--plugin eosio::http_client_plugin \
	--plugin eosio::history_plugin \
	--plugin eosio::history_api_plugin \
	--data-dir $DATADIR"/data" \
	--blocks-dir $DATADIR"/blocks" \
	--config-dir $DATADIR"/config" \
	--http-validate-host=false \
	--verbose-http-errors \
	--genesis-json $HOME/eos/eos_data/config/genesis.json \
	--max-transaction-time=1000 \
	--filter-on=* \
	>> $HOME/eos/eos_data/nodeos.log 2>&1 &\
echo $! > $DATADIR"/eosd.pid"
