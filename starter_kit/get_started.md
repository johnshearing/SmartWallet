To work along on your own, follow the installation instructions found at the following link.  
https://github.com/input-output-hk/marlowe-starter-kit  

Any behavior we wish to create from Brian's example can be accomplished by making changes to these three files:  
index.html, view.css, and controller.js  
So if you setup the official starter kit linked above and substitute the three files found here for the three in the offical repository then you can see my changes and make your own.  

The problem we hope to solve may be the biggest obstacle for mass adoption.  
Most people remain in the legacy financial system because they can't manage their 24 words.  
Many of the worlds population just don't have a secure place to store their words.  
Many fear they may lose access to their crypto funds either by theft or lack of familiarity with basic security.  
Finally, there is no simple and foolproof way for the average person to transfer their crypto to beneficiaries.  

The Ledger company tried to solve the problem by sending the keys out of their "secure" device.  
They think the customers they gain will more than make up for the customers they lost when they broke their security promise to the community.  
I think we can give people the protection they need without forcing them to give up their keys.  

Whatever we come up with has to be secure, very simple to use, and extremely difficult to misuse.  
And if the contract owner dies then it must be very simple for beneficiaries to claim the funds.  
If we can build a smart contract wallet with these qualities then we open the doors to everyone.  

We are trying to make a smart contract wallet with recovery options.  
The challenge is that smart contracts are not meant to be changed.  
In fact they are immutable, they can't be changed.  
Furthermore, they are meant to execute in a predefined series of steps from beginning to end.
But we will need random access the these contracts.
We will need to change beneficiaries, move release dates, change stake pools, change signatories, deposit and withdraw funds, and more.

To manage all the changes, we will deploy a reference script to the cardano blockchain which holds the basic structure of the smart contract wallet.
We could think of this as a class or a blueprint for the smart contract wallet.

Then any individual can send a transaction to the blockchain which contains parameters in the transaction datum.
The transaction uses the on chain reference script as a template and the parameters carried by the datum to create a custom smart contract wallet defining specific behavior for the individual's needs.
We could think of this much like an instance of the class where contract owners, beneficiaries, release dates, stake pools, signatories, and number of required signatures are defined.

Then the owner can then send funds to the contract for safe keeping.

When the contract owner does anything such as deposit or withdraw funds, change the stake pool, move the release date, or anything else, the action is taken and then a new contract is generated with the new parameters.
Then funds are moved from the old contract to the new in the same transaction. We can think of the old smart contract as like an eUTxO, and the new contract as a change address.

Thanks to Brian Bush of IOG for teaching Marlowe and for the CIP30 example.
Thanks to wmo.co for coming up with the idea to use the datum for carrying the contract parameters.

More info to come shortly
