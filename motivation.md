The problem we hope to solve may be the biggest obstacle for mass adoption.  
Most people remain in the legacy financial system because they can't manage their 24 words.  
Much of the world's population just don't have a secure place to store their words.  
Many fear they may lose access to their crypto funds either by theft or from lack of familiarity with basic security.  
Finally, there is no simple and foolproof way for the average person to transfer their crypto to beneficiaries.  

The Ledger company tried to solve the problem by sending the private keys out of their "secure" device.  
They think the customers they gain will more than make up for the customers they lost when they broke their security promise to the community.  
Perhaps we can give people the protection they need without forcing them to give up their keys.  

Whatever we come up with has to be secure, very simple to use, and extremely difficult to misuse.  
And if the contract owner dies then it must be very simple for beneficiaries to claim the funds.  
If we can build a smart contract wallet with these qualities then we open the doors to everyone.  

We are trying to make a smart contract wallet with recovery options.  
If the contract owner loses the hardware wallet controlling the smart contract or if the owner dies then, after a set period of delay, the contract funds become available to claim using hardware wallets which control the recovery addresses.  
The challenge is that smart contracts are not meant to be changed.  
In fact they are immutable, they can't be changed.  
Furthermore, they are meant to execute in a predefined series of steps from beginning to end. But we will need random access to these contracts.  
We will need to change beneficiaries, move release dates, change stake pools, change signatories, deposit and withdraw funds, and more.  

To manage all the changes, we will deploy a reference script to the cardano blockchain which holds the basic structure of the smart contract wallet. We could think of this as a class or a blueprint for the smart contract wallet.  

Then any individual can send a transaction to the blockchain which contains parameters in the transaction datum.  
The transaction uses the on chain reference script as a template and the parameters carried by the datum to create a custom smart contract wallet defining specific behavior for the individual's needs.  
We could think of this much like an instance of the class where contract owners, beneficiaries, release dates, stake pools, signatories, and number of required signatures are defined.  

Then the owner can then send funds to the contract for safe keeping.  

When the contract owner does anything such as: deposit or withdraw funds, change the stake pool, move the release date, or anything else, the action is taken and then a new contract is generated from the reference script using the new parameters carried by the transaction datum.  
Then funds are moved from the old contract to the new in the same transaction.  
We can think of the old smart contract as like an eUTxO, and the new contract as a change address.  

If the contract owner loses the hardware wallet controlling the smart contract or if the owner dies then, after a set period of delay, the contract funds become available to claim using hardware wallets which control the recovery addresses.  

Thanks to Brian Bush of IOG for teaching Marlowe and for the CIP30 example.  
Thanks to wmo.co for coming up with the idea to use the datum for carrying the contract parameters.   

Notes:  
Brian Bush noted that the release epoch can be updated using a Choice block that contains a TimeInvervalEnd value.  
A bit of time arithmetic in the contract will be required.  
We will need to know if the release date can be pushed forward indefinitely using this method.  
If not then we will likely just make a new contract each time we need to push the release epoch forward.  

Brian Bush also noted the following:  
Future versions of the Marlowe language might evolve to include updating of addresses etc. after the contract has been created.  
This is an open-source project, so what future versions of the language will support depends upon community involvement.  
Feel free to post feature requests:  
GitHub issues for public feature requests: https://github.com/input-output-hk/marlowe-cardano/issues  
Zendesk tickets for requests to IOG: https://iohk.zendesk.com/  
Discussion of proposals for changes to the Marlowe language: https://github.com/input-output-hk/MIPs/discussions  

Brian Bush noted the following with regard to development strategy:    
I've found, personally, that starting with a small contract that is a just microcosm of the contract I eventually want to build helps me understand the issues involved and gives me new ideas for features and workarounds; sometimes a slight reframing of the use case can make the contract far easier to implement.  
I've learned a lot from experimenting with small Marlowe prototypes.  
