# SmartWallet

## Cardano Smart Contract Works Just Like A Hardware Wallet
## Trustless Last Will And Fund Recovery Options Supported
## Lose your seed phrase? No problem!
## Funds released to recovery accounts or beneficiaries after period of inactivity
## :)

Difficulty securing seed phrases might be the biggest obstacle for cryptocurrency mass-adoption.  
Loss of seed phrases do to untimely death causes suffering to families.  
SmartWallet fixes these issues.  

With SmartWallet we only needed our 24 randomly generated words one time...  
just to set up our wallets...  
and then we can destroy the seed phrase words if we want...  
confidently knowing our accounts are secure...  
and that we or our beneficiaries could never lose access to the wallet funds?  

Nothing to lose.  
Nothing to get stolen.  
Nothing to forget.  
No one we need to trust.  

Deploying a smart contract with the following properties should make this possible.
* Contract can receive funds like any wallet.
* Contract can disperse funds of a given amount... to a given receiving address... given the correct signature... just like any wallet.
* Contract contains a variable called **owners-public-key**
  * This is used to verify that commands sent to the contract have been signed by the owner's hardware wallet.
* Contract contains a variable called **global-epoch-trigger-point**.
  * This is the epoch at which it becomes possible to send funds to recovery accounts or to the beneficiary accounts.
* Contract contains a variable called **number of epochs-from-now**.
  * This is a number used to update the **global-epoch-trigger-point**. 
* Contract contains as many variables as needed called **recovery-address-01**, **recovery-address-02**, **...**
  * These are the addresses which can claim funds if the contract owner dies, or loses the hardware wallet controling the contract.
* Contract contains as many variables as needed called **extra-epochs-delayed-for-recovery-address-01**, **extra-epochs-delayed-for-recovery-address-02**, **...**
  * These variables are used to specify how many epochs past the **global-epoch-trigger-point** each recovery address must wait before it becomes valid and able to claim funds.
* Contract can disperse all funds to any recovery address after the **global-epoch-trigger-point** has been passed.
* If the number of epochs specified in the **extra-epochs-delayed-for-recovery-address-XX** is greater than zero then that many epochs must also pass after **global-epoch-trigger-point** has been reached before funds can be sent to that address.
* We notice there can be many preprogrammed recovery addresses, each associated with their own unique times in the future when it will be possible to send funds to those unique addresses. 
  * The first of these addresses serves as the primary recovery or beneficiary address.
  * The rest of these serve as backup addresses in case the contract owner or first beneficiary loses control of the hardware wallet which controls the recovery address.
  * The times when each recovery address can become valid may be staggered creating an order in which people may claim the funds.
* For the contract to disperse all funds to a preprogramed recovery/beneficiary address, the contract owner or beneficiary must send a signed transaction from the hardware wallet controlling the recovery address at any time after the address becomes valid. The contract will then immediately send all funds in the contract to the recovery address.
  * This method establishes that the contract owner or beneficiary has control of the preprogrammed recovery address and so ensures that the funds will not be lost.
* Contract can receive a message signed with the owners hardware wallet proving ownership of the contract.
  * The message may contain a command to add, update, or deleted recovery addresses and their associated delays past the **global-epoch-trigger-point**.
  * The message may contain a command to change the value stored in the variable called **number of epochs-from-now**.  
  * The message may contain a command to update the **global-epoch-trigger-point** with respect to **number of epochs-from-now**.  
    * This is how the owner tells the contract that he or she is still alive and in control of their hardware wallet.
    * This is also how the contract owner sets the time interval before the owner/beneficiaries can recover all the funds from the contract. 
    * If the owner does not message the contract again within the time specified by **number of epochs-from-now** then it is presumed that the owner has lost the control of their hardware wallet or is perhaps dead. 

The contract works as follows:  
* The owner deploys the smart contract.
* The owner transfers a small amount of funds to the contract. 
* The owner withdraws a small amount of funds from the contract to be certain the owner has control of funds in the contract and that the owner can use the contract just like a hardware wallet.
* The owner sends a message to the contract to set the beneficiary addresses and the delays on each address before they may receive funds. 
  * These could be a friends or relatives or just a recovery address controlled by the owner.
* The owner sends a transaction to set the **number of epochs-from-now** for a short time into the future.
  * If **number of epochs-from-now** is set to zero or any negative number then no recovery address will be able to claim the funds but the contract owner will still be able to use the contract like a hardware wallet.
* The owner waits for the **global-epoch-trigger-point** to pass.
* The owner asks the beneficiary claim the funds in the contract with a transactions built by a simple web app built for the purpose and signed with the hardware wallet controlling the recovery address.  
  * All funds should be dispersed to the beneficiary address when the transaction is received.
* If everything has been working correctly the owner loads the contract with significant funds and sets the **number of epochs-from-now** for perhaps one month into the future.
* Then, before the month has passed, the owner must send a transaction to the contract updating the **global-epoch-trigger-point** again with respect the **number of epochs-from-now**.
  * If the owner fails to update the **global-epoch-trigger-point** the owner is assumed to have lost the controlling hardware wallet so all funds become available for beneficiaries to collect.
  * In this way, the contract owner can set up a hardware wallet and then destroy the 24 words. 
  * If the contract owner loses the hardware wallet or dies then any one of beneficiary wallets will be able to collect all the funds when the **global-epoch-trigger-point** + **extra-epochs-delayed-for-recovery-address-XX** has passed.

Funds are always safe.  
There is nothing to lose.  
There is nothing to get stolen.  
There is nothing to forget.  
There is no one we need to trust.  
