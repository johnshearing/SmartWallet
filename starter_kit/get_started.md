### Anything we wish to create from IOG's Marlowe example can be accomplished by changing the following files:   
[index.html](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/index.html), [view.css](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/view.css), and [controller.js](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/controller.js)   
So if you setup the official starter kit linked below and substitute the three files found here for the three in the official repository then you can see my changes and make your own.  

The development approach is to make incremental small (non-breaking) changes to the example Marlowe application provided by Brian Bush of IOG. Little by little we will transform the example into the desired smart contract wallet with recovery options.  

To work along on your own, follow the installation instructions found at the following link.  
https://github.com/input-output-hk/marlowe-starter-kit/blob/main/docker.md  

### Remember to do the following during the installation:  
After cloning the starter kit and after changing into to the starter kit directory don't forget to switch branches using the following command:   
`git checkout bwbush/CIP30`  
  

### To avoid permissions error:   
During the installation, you will be asked to run the following command:    
`cardano-cli query tip`   
If running that command produces a permissions error then run the following line before `cardano-cli query tip` is attempted.  

`sudo chown -R $(id -u):$(id -g) /var/lib/docker/volumes/marlowe-starter-kit_shared/_data/node.socket`  

These two notes are not stated in the video linked below. 
But the video has important information so you should follow the video as you follow these instructions.
  
The companion video for the installation instructions is found at the following link:  
https://youtu.be/45F5ld8NNHM   


The following are the installation commands:  
```  
git clone https://github.com/input-output-hk/marlowe-starter-kit/tree/bwbush/CIP30   
cd marlowe-starter-kit  
git checkout bwbush/CIP30  
nix develop  
export NETWORK=preprod  
docker-compose up -d  
docker-compose ps  

```   

```   
export CARDANO_NODE_SOCKET_PATH=$(docker volume inspect marlowe-starter-kit_shared | jq -r '.[0].Mountpoint')/node.socket  
f=$(dirname $CARDANO_NODE_SOCKET_PATH)  
while [[ $f != / ]]; do sudo chmod a+rx "$f"; f=$(dirname "$f"); done  
sudo chmod a+rwx $CARDANO_NODE_SOCKET_PATH  
```  

```  
# Only required for `marlowe-cli` and `cardano-cli`.  
case "$NETWORK" in  
  preprod)  
    export CARDANO_TESTNET_MAGIC=1  
    ;;  
  preview)  
    export CARDANO_TESTNET_MAGIC=2  
    ;;  
  *)  
    # Use `mainnet` as the default.  
    unset CARDANO_TESTNET_MAGIC  
    ;;  
esac  

# Only required for `marlowe-runtime-cli`.  
export MARLOWE_RT_HOST="127.0.0.1"  
export MARLOWE_RT_PORT=3700  

# Only required for REST API.  
export MARLOWE_RT_WEBSERVER_HOST="127.0.0.1"  
export MARLOWE_RT_WEBSERVER_PORT=3780  
export MARLOWE_RT_WEBSERVER_URL="http://$MARLOWE_RT_WEBSERVER_HOST:$MARLOWE_RT_WEBSERVER_PORT"    
```  

```  
cardano-cli query tip --testnet-magic "$CARDANO_TESTNET_MAGIC" | json2yaml   
```  

If you get a permissions error after running the last command then run the following command and then query the tip again.  
`sudo chown -R $(id -u):$(id -g) /var/lib/docker/volumes/marlowe-starter-kit_shared/_data/node.socket`  


### Marlowe Runtime Proxy Service

Check that the `marlowe-runtime-cli` command can communicate with the Marlowe Runtime backend services by querying the history of one of the Marlowe contracts that has previously been executed on the blockchain.

```bash
marlowe-runtime-cli log "f06e4b760f2d9578c8088ea5289ba6276e68ae3cbaf5ad27bcfc77dc413890db#1"
```

```console
transaction f06e4b760f2d9578c8088ea5289ba6276e68ae3cbaf5ad27bcfc77dc413890db (creation)
ContractId:      f06e4b760f2d9578c8088ea5289ba6276e68ae3cbaf5ad27bcfc77dc413890db#1
SlotNo:          11630746
BlockNo:         224384
BlockId:         f729f57b3bd99dd1d55a5a65b8c74f459dadae784dd55536444770dd2c2cdd2e
ScriptAddress:   addr_test1wp4f8ywk4fg672xasahtk4t9k6w3aql943uxz5rt62d4dvqu3c6jv
Marlowe Version: 1



transaction 5a3ed57653b4635c76d2949558f3718e34324a8a1ffc740360ae7d85839de6d9 (close)
ContractId: f06e4b760f2d9578c8088ea5289ba6276e68ae3cbaf5ad27bcfc77dc413890db#1
SlotNo:     16674281
BlockNo:    458964
BlockId:    23adcef9d89afc4354155c62960512c810619d8244239f8c642745b034a58fc2
Inputs:     []
```    


### Marlowe Runtime Web Server

Check that one can communicate with the Marlowe Runtime web server and receive a `200 OK` response.


```bash
curl -sSI "$MARLOWE_RT_WEBSERVER_URL/healthcheck"
```

```console
HTTP/1.1 200 OK
Date: Thu, 16 Mar 2023 18:12:51 GMT
Server: Warp/3.3.24
Content-Type: application/json;charset=utf-8
```


#### Running the CIP30 example:  
At the terminal window, cd into the following directory:  
`cd 06-cip30`  

With your browser, go to the following webpage and follow the instructions there:  
https://github.com/input-output-hk/marlowe-starter-kit/tree/bwbush/CIP30/06-cip30    

