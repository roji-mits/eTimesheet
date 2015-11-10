Meteor.startup ->
  Meteor.startup ->
  if Meteor.users.find().count() == 0
    users = [{'email':'loceehide_rose@hotmail.com', 
    'verified':true,
    'password':'loceehide_rose@hotmail.com'}]
    users.forEach (user) ->
      Meteor.users.insert user
  if Things.find().count() == 0
    things = [
      'Data on the Wire'
      'One Language'
      'Database Everywhere'
      'Latency Compensation'
      'Full Stack Reactivity'
      'Embrace the Ecosystem'
      'Simplicity Equals Productivity'
    ]
    things.forEach (thing) ->
      Things.insert 
        name: thing
        name_sort: thing.toLowerCase()
        createdAt: new Date()