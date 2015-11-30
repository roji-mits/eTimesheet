'user strict'
Accounts.onCreateUser (options, user) ->
  console.log(user)
  if options.stopActivationLink
    user.emails[0].verified = true
  user.profile=options.profile
  return user
