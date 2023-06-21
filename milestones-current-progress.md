### Development Strategy  
Make continuous small changes to IOG's working CIP30 smart contract and UI example until we have the smart contract wallet with recovery options.  

### Completed  
[Functioning mockup of UI](https://github.com/johnshearing/SmartWallet/tree/main/starter_kit) in HTML, CSS and JavaScript based on IOG's CIP30 smart contract example with no breaking changes.  
* Now we have an idea about:  
  * What the user will see and do
  * What data we need to collect from the user and from the blockchain
  * What functions we will need to implement in order to achieve our goal.
 
 Deploy a reference script to the testnet which will serve as template for any user's smart contract wallet.  
[Using the example linked here for guidance.](https://github.com/input-output-hk/real-world-marlowe/blob/main/firsts/reference/ReadMe.ipynb)

It was discovered that reference scripts can not be used to receive parameters so they are not suitable for use as smart contract templates  
So I have found no viable method for using old scripts as eUTxOs and new scripts as change addresses.

### In Progress  
Progress stalled.  
Looking for other ways to produce wallet functionality with recovery options which do not require giving up custody of private keys.

### Planned   
