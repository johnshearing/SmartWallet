### Anything we wish to create from IOG's Marlowe example can be accomplished by changing the following files:   
[index.html](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/index.html), [view.css](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/view.css), and [controller.js](https://github.com/johnshearing/SmartWallet/blob/main/starter_kit/controller.js)   
So if you setup the official starter kit linked below and substitute the three files found here for the three in the official repository then you can see my changes and make your own.  

The development approach is to make incremental small (non-breaking) changes to the example Marlowe application provided by Brian Bush of IOG. Little by little we will transform the example into the desired smart contract wallet with recovery options.  

To work along on your own, follow the installation instructions found at the following link.  
https://github.com/input-output-hk/marlowe-starter-kit/blob/main/docker.md  

### Remember to do the following during the installation
These items are not mentioned in the installation instructions linked above:    

After cloning the starter kit and after changing into to the starter kit directory don't forget to switch branches using the following command:   
`git checkout bwbush/CIP30`  

The following command may not be necessary after the first installation:  
docker-compose up -d  

To avoid permissions error:   
During the installation, you will be asked to run the following command:    
`cardano-cli query tip`   
If running that command produces a permissions error then run the following line before `cardano-cli query tip` is attempted again.  

`sudo chown -R $(id -u):$(id -g) /var/lib/docker/volumes/marlowe-starter-kit_shared/_data/node.socket`  

These three notes are not stated in the video linked below nor in the instructions linked above.  
But the video has important information so you should follow the video as you follow these instructions.  
  
The companion video for the installation instructions is found at the following link:  
https://youtu.be/45F5ld8NNHM   

#### Running the CIP30 example:  
At the terminal window, cd into the following directory:  
`cd 06-cip30`  

With your browser, go to the following webpage and follow the instructions there:  
https://github.com/input-output-hk/marlowe-starter-kit/tree/bwbush/CIP30/06-cip30    

