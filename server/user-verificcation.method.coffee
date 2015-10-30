'use strict'

Meteor.methods
  chckEmail:(userId,emailToVerify) ->
    console.log(userId,emailToVerify)
    Accounts.sendVerificationEmail(userId,emailToVerify)

  resetpw:(userId, newPlaintextPassword) ->
    Accounts.setPassword(userId, newPlaintextPassword)

  



  

  