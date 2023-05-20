# SmartWallet

Difficulty securing seed phrases might be the biggest obstacle for mass-adoption of cryptocurrency from an untimely death. 
Loss of seed phrases and associated family funds do to untimely death is also an obstacle.



What if we only needed our 24 randomly generated words one time... 
just to set up our wallets... 
and then we could destroy the seed phrase if we wanted...
confidently knowing our accounts are secure...
and that we could never lose access to our funds?

Nothing to lose. 
Nothing to get stolen. 
Nothing to forget.
No one we need to trust.

Deploying a smart contract with the following properties should make this possible.
* Contract can receive funds like any wallet.
* Contract can disperse funds of a given amount to a given receiving address given the correct signature, just like any wallet.
* Contract contains a variable called **owners-public-key**
  * This is used to verify that commands sent to the contract have been signed by the owner's hardware wallet.
* Contract contains a variable called **global-epoch-trigger-point**.
  * This is the epoch at which it becomes possible to send funds to the beneficiary.
* Contract contains a variable called **number of epochs-from-now**.
  * This is a number used to update the **global-epoch-trigger-point**. 
* Contract contains as many variables as needed called **beneficiary-address-01**, **beneficiary-address-02**, **...**
  * These are the addresses where funds can go if the contract owner dies, or loses control of his/her hardware wallet which is used to sign messages that control the contract.
* Contract contains as many variables as needed called **extra-epochs-delayed-for-beneficiary-address-01**, **extra-epochs-delayed-for-beneficiary-address-02**, **...**
  * These variables are used to specify how many epochs past the **global-epoch-trigger-point** each beneficiary address must wait before it becomes valid and able to receive funds.
* Contract can disperse all funds to any beneficiary address after the **global-epoch-trigger-point** has been passed.
* If the number of epochs specified in the **extra-epochs-delayed-for-beneficiary-address-XX** is greater than zero then that many epochs must also pass after **global-epoch-trigger-point** has been reached before funds can be sent to that address.
* We notice there can be many preprogrammed beneficiary addresses, each associated with their own unique times in the future when it will be possible to send funds to those unique addresses. 
  * One of these addresses serves as the primary beneficiary address.
  * The rest of these serve as backup addresses in case the first beneficiary loses control of their hardware wallet.
* For the contract to disperse all funds to a preprogramed beneficiary address, the beneficiary must send 1 ADA to the contract from the hardware wallet controlling that address at any time after the address becomes valid. The contract will then immediately send all funds in the contract to the beneficiary's address.
  * This method establishes that the beneficiary has control of the preprogrammed beneficiary address and so ensures that the funds will not be lost.
* Contract can receive a message signed with a specific hardware wallet proving ownership of the contract.
  * The message may contain a command to change the value stored in the variable called **number of epochs-from-now**. This will set the **global-epoch-trigger-point**.
  * The message may contain a command to add, update, or deleted beneficiary addresses and their associated delays past the **global-epoch-trigger-point**.
* Any spending, receiving, or message transaction by the contract's owner will set the **global-epoch-trigger-point** with respect to the **number of epochs-from-now**.
  * This is how the owner tells the contract that he or she is still alive and in control of their hardware wallet.
  * This is also how the contract owner sets the time interval before beneficiaries can collect all the funds from the contract. If the owner does not message the contract again within the **number of epochs-from-now** then it is presumed that the owner has lost the control of their hardware wallet or is perhaps dead.

The contract works as follows:  
* The owner deploys the smart contract.
* The owner transfers a small amount of funds to the contract. 
* The owner withdraws a small amount of funds from the contract to be certain the owner has control of funds in the contract.
* The owner sends a message to the contract to set the beneficiary addresses and the delays on each address before they may receive funds. 
  * This could be a friend or relative or just a wallet address controlled by the owner.
* The owner sends a transaction to set the **number of epochs-from-now** for a short time into the future.
* The owner waits for the **global-epoch-trigger-point** to pass.
* The owner askes the beneficiary to send 1 ADA to the contract using the hardware wallet controlling the beneficiary address.
  * All funds should be dispersed to the beneficiary address when the 1 ADA is received.  
* If everything has been working correctly the owner loads the contract with significant funds and sets the **number of epochs-from-now** for perhaps one month into the future.
* Every time the owner interacts with the contract the **global-epoch-trigger-point** will be set with respect the value contained in the variable called **number of epochs-from-now**.
The contract owner must spend, receive, or send a signed message to the contract before the new **global-epoch-trigger-point** is reached or all funds will become available for beneficiaries to collect.

In this way, the contract owner could set up a hardware wallet and then destroy the 24 words. If they lose the wallet it's no big deal - any one of beneficiary wallets will be able to collect all the funds when the **global-epoch-trigger-point** has passed.

Funds are always safe.
There is nothing to lose. 
There is nothing to get stolen. 
There is nothing to forget.
There is no one we need to trust.



Comments please.
I need to know the following before starting this work:
Does a smart contract like this already exist?
Can anyone think of a reason this wouldn't work or can't be done?

Much thanks
