### Anything we wish to create from IOG's Marlowe example can be accomplished by changing the following files:   
index.html, view.css, and controller.js   
So if you setup the official starter kit linked below and substitute the three files found here for the three in the official repository then you can see my changes and make your own.  

The development approach is to make incremental small (non-breaking) changes to the example Marlowe application provided by Brian Bush of IOG.  
Little by little we will transform the example into the desired smart contract wallet with recovery options.  

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

These two notes are not stated in the instructions.  
  
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


#### Running the CIP30 example:  
At the terminal window, cd into the following directory:  
`cd 06-cip30`  

With your browser, go to the following webpage and follow the instructions there:  
https://github.com/input-output-hk/marlowe-starter-kit/tree/bwbush/CIP30/06-cip30    

