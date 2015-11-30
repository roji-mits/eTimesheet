'use strict'

Meteor.methods
  chckEmail:(userId,emailToVerify) ->
    console.log(userId,emailToVerify)
    Accounts.sendVerificationEmail(userId,emailToVerify)

  resetpw:(userId, newPlaintextPassword) ->
    Accounts.setPassword(userId, newPlaintextPassword)

  

 ##Meteor.users.update('emails.address':useradd,{$set:{emails:[{"address":useradd,"verified":true,"isActive":1}]}})
