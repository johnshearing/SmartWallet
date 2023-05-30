#!/bin/bash

# Below is a typical command to run this script at the terminal window.
# send-funds.sh sender_bob receiver_alice 4 transXX

# send-fund.sh is the name of this bash script.
# Put this script in the scripts folder of course Docker container.


# sender-bob has 3 files in the keys directory: sender-bob.addr, sender-bob.vkey, sender-bob.skey
# sender-alice has 3 files in the keys directory: sender-alice.addr, sender-alice.vkey, sender-alice.skey
# These files were created with the create-key-pair.sh script found in the scripts directory of our course Docker container.
# Create these files before using this script.

# The number four in the command above means we are sending 4 ADA

# transXX is the name of the directory which will be created inside the keys directory to
# hold the files created by this script in order to build and execute the transaction.
# Be sure to replace transXX with a new name everytime you send funds so as not to 
# overwrite information in historical transaction folders.

if [ -z "$1" ]; then
    >&2 echo "expected sender name as argument"
    exit 1
fi

if [ -z "$2" ]; then
    >&2 echo "expected recipient name as argument"
    exit 1
fi

if [ -z "$3" ]; then
    >&2 echo "expected amount in ADA as argument"
    exit 1
fi

if [ -z "$4" ]; then
    >&2 echo "expected transaction folder name as argument"
    exit 1
fi

key_path=/workspace/keys
mkdir -p "$key_path"


trans_path=$4
mkdir -p "$key_path/$trans_path"


# Sender's information
s_vkey="$key_path/$1.vkey"
s_skey="$key_path/$1.skey"
s_addr="$key_path/$1.addr"

# Receiver's information
r_vkey="$key_path/$2.vkey"
r_skey="$key_path/$2.skey"
r_addr="$key_path/$2.addr"

# Get the protocol parameters.
cardano-cli query protocol-parameters --testnet-magic 2 --out-file $key_path/$trans_path/pparams.json

# Convert spending amount from ADA to Lovelace
amt_lovelace_spend=$(($3 * 1000000))

# Get the amount in the sending account
amt_in_sending_account=$(cardano-cli query utxo --address "$(cat $s_addr)" --testnet-magic 2  | awk 'NR>2 {print $3}')


# Build a trial transaction
cardano-cli transaction build-raw --babbage-era \
--tx-in $(cardano-cli query utxo --address $(cat $s_addr) --testnet-magic 2 --out-file  /dev/stdout | jq -r 'keys[0]') \
--tx-out $(cat $r_addr)+$amt_lovelace_spend \
--tx-out $(cat $s_addr)+$(($amt_in_sending_account-$amt_lovelace_spend)) \
--fee 0 \
--protocol-params-file $key_path/$trans_path/pparams.json \
--out-file $key_path/$trans_path/tx.draft


# Get the transaction fee
cardano-cli transaction calculate-min-fee --tx-body-file $key_path/$trans_path/tx.draft \
--testnet-magic 2 \
--protocol-params-file $key_path/$trans_path/pparams.json \
--tx-in-count 1 \
--tx-out-count 2 \
--witness-count 1 \
> $key_path/$trans_path/fee.draft


# Grab the fee from the file and put it into a variable
trans_fee=$(cat $key_path/$trans_path/fee.draft  | awk '{print $1}')


# Rebuild the transaction body adding the fees and recalculating the change that we will send
cardano-cli transaction build-raw --babbage-era \
--tx-in $(cardano-cli query utxo --address $(cat $s_addr) --testnet-magic 2 --out-file  /dev/stdout | jq -r 'keys[0]') \
--tx-out $(cat $r_addr)+$amt_lovelace_spend \
--tx-out $(cat $s_addr)+$(($amt_in_sending_account-$amt_lovelace_spend-$trans_fee)) \
--fee $(cat $key_path/$trans_path/fee.draft  | awk '{print $1}') \
--protocol-params-file $key_path/$trans_path/pparams.json \
--out-file $key_path/$trans_path/tx.raw


# Sign the transaction
cardano-cli transaction sign \
--tx-body-file $key_path/$trans_path/tx.raw \
--signing-key-file $r_skey \
--testnet-magic 2 \
--out-file $key_path/$trans_path/tx.signed


echo Sending $amt_lovelace_spend Lovelace
echo $amt_in_sending_account Lovelace are at the spending address
echo The amount at the spending address minus the amount being spent is $(($amt_in_sending_account-$amt_lovelace_spend))
echo The transaction fee will be $trans_fee
echo The change will be $(($amt_in_sending_account-$amt_lovelace_spend-$trans_fee)) That is amt_in_sending_account minus amt_lovelace_spend minus trans_fee


# Submit the transaction
cardano-cli transaction submit \
--testnet-magic 2 \
--tx-file $key_path/$trans_path/tx.signed 


