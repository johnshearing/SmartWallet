To work along on your own, follow the installation instructions found at the following link.  
https://github.com/input-output-hk/marlowe-starter-kit  

After cloning the starter kit, don't forget to switch branches after changing to the starter kit directory.  
```  
git clone https://github.com/input-output-hk/marlowe-starter-kit/tree/bwbush/CIP30  
cd marlowe-starter-kit  
git checkout bwbush/CIP30  
nix develop  
export NETWORK=preprod  
docker-compose up -d  
```  

### To avoid permissions error:  
During the installation, you will be asked to run the following command:    
`cardano-cli query tip`  
If running that command produces a permissions error then run the following line before `cardano-cli query tip` is attempted.  

`sudo chown -R $(id -u):$(id -g) /var/lib/docker/volumes/marlowe-starter-kit_shared/_data/node.socket`  

Any behavior we wish to create from IOG's official example can be accomplished by making changes to these three files:   
index.html, view.css, and controller.js   
So if you setup the official starter kit linked above and substitute the three files found here for the three in the official repository then you can see my changes and make your own.   

