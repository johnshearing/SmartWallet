I started working with Brian's example.
To work along on your own, follow the installation instructions found at the following link.
https://github.com/johnshearing/SmartWallet/tree/main/starter_kit

Any behavior we wish to create from Brian's example can be accomplished by making changes to these three files:
index.html, view.css, and controller.js
So if you setup Brian's starter kit and substitute my three files for his then you can see my changes and make your own.

The problem I hope we can solve may be the biggest obstacle for mass adoption.
Most people remain in the legacy financial system because they can't manage their 24 words.
Many of the worlds population just don't have a secure place to store their words.
Many fear they may lose access to their crypto funds either by theft or lack of familiarity with basic security.
Finally, there is no simple and foolproof way for the average person to transfer their crypto to beneficiaries.

The Ledger company tried to solve the problem by sending the keys out of their "secure" device.
They think the customers they gain will more than make up for the customers they lost when they broke their security promise to the community.
I think we can give people the protection they need without forcing them to give up their keys.

Whatever we come up with has to be very simple use and extremely difficult to misuse.
And if the contract owner dies then it must be very simple for beneficiaries to claim the funds.
If we can build a smart contract wallet with these qualities then we open the doors to everyone.

We are trying to make a smart contract wallet with recovery options.
The challenge is that smart contracts are not meant to be changed.
They are meant to execute in a predefined series of steps from beginning to end.
But we will need to change beneficiaries, move release dates, change stake pools, change signatories, deposit and withdraw funds, and more.

To manage all the changes, we will deploy a reference script to the cardano blockchain which holds the basic structure of the smart contract wallet.
We could think of this as a class.

Then anybody can send a transaction to the blockchain which contains parameters in the datum which define specific behavior for the contract.
We could think of this much like an instance of the class where beneficiaries, release dates, stake pools, signatories, and number of signatures are defined.

Then the owner can send funds to the contract,

For this reason, using a datum in the transaction to hold parameters for the following contract seems ideal.
This approach seems most simple and does not require leaving the Marlowe environment.
Thank you for coming up with the idea wmo.co 
I think you have already ensured our success.

More info to come shortly
