# SmartWallet

## Cardano Smart Contract Works With Your Hardware Wallet
## Use It Just Like Any Hardware Wallet
## Trustless Last Will and ADA Recovery Options Supported
## Lost your hardware wallet? Lost your 24 word seed phrase too? No problem!
## Funds released to recovery accounts or beneficiaries after a period of inactivity
## :)
## Muti-signatures supported.  

Difficulty securing seed phrases might be the biggest obstacle for cryptocurrency mass-adoption.  
Loss of seed phrases due to untimely death causes suffering to families.  
SmartWallet fixes these issues.  

With SmartWallet we only needed our 24 randomly generated words one time...  
just to set up a hardware wallet...  
and then we can destroy the seed phrase words if we want...  
confidently knowing our accounts are secure...  
and that we or our beneficiaries could never lose access to the wallet funds?  

Funds are always safe.  
Nothing to lose.  
Nothing to get stolen.  
Nothing to forget.  
No one we need to trust.  

Deploying a smart contract with the following properties should make this possible.
* Contract can receive funds like any wallet.
* Contract can disperse funds of a given amount... to a given receiving address... given the correct signature... just like any wallet.
* Contract contains a parameter called **global-release-epoch**
  * This defines the epoch when contract funds can be claimed by recovery addresses.
* Contract can receive a message signed with the owner's hardware wallet proving ownership of the contract.  
  * The message may contain a command to add, update, or deleted recovery addresses and their associated delays past the **global-release-epoch**.
  * The message may contain a command to change the value stored in the variable called **global-release-epoch**.
    * This is how the owner tells the contract that he or she is still alive and in control of their hardware wallet.
    * This is also how the contract owner sets the time interval before the owner/beneficiaries can recover all the funds from the contract. 
    * If the owner does not message the contract again within the time specified by **number of epochs-from-now** then it is presumed that the owner has lost the control of their hardware wallet or is perhaps dead. 

The contract works as follows:  
* The owner deploys the smart contract.
* The owner transfers a small amount of funds to the contract. 
* The owner withdraws a small amount of funds from the contract to be certain the owner has control of funds in the contract and that the owner can use the contract just like a hardware wallet.
* The owner sends a message to the contract to set the beneficiary addresses and the delays on each address before they may receive funds. 
  * These could be friends or relatives or just a recovery address controlled by the owner.
* The owner sends a transaction to set the **number of epochs-from-now** for a short time into the future.
  * If **number of epochs-from-now** is set to zero or any negative number then no recovery address will be able to claim the funds but the contract owner will still be able to use the contract like a hardware wallet.
* The owner waits for the **global-release-epoch** to pass.
* The owner asks the to beneficiary claim the funds in the contract with a transaction built by a simple web app made for the purpose and signed with the hardware wallet controlling the recovery address.  
  * All funds should be dispersed to the beneficiary address when the transaction is received.
* If everything has been working correctly the owner loads the contract with significant funds and sets the **number of epochs-from-now** for perhaps one month into the future.
* Then, before the month has passed, the owner must send a transaction to the contract updating the **global-release-epoch** again with respect to the **number of epochs-from-now**.
  * If the owner fails to update the **global-release-epoch** the owner is assumed to have lost the controlling hardware wallet so all funds become available for recovery addresses to claim.
  * In this way, the contract owner can set up a hardware wallet and then destroy the 24 words. 
  * If the contract owner loses the hardware wallet or dies then any one of the recovery wallets will be able to collect all the funds when the **global-release-epoch** + **extra-epochs-delayed-for-recovery-address-XX** has passed.

Funds are always safe.  
There is nothing to lose.  
There is nothing to get stolen.  
There is nothing to forget.  
There is no one we need to trust.  



Don't completely trust the firmware on your Ledger Nano S?  
Then also require a second signature using a different brand of hardware/software wallet for all spending transactions.
