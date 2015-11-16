Meteor.startup ->
  if Meteor.users.find().count() == 0
    users = [{
        "_id" : "pB9HofZMgeEvG4u9M",
        "createdAt" : new Date(),
        "services" : {
          "password" : {
          "bcrypt" : "$2a$10$h.fCULzFVDh8jUcNs9vkUO/1uewa5/H30JWFtYhdu6nM/wdbh1McO"
          },
          "resume" : {
            "loginTokens" : [
              {
                "when" : new Date(),
                "hashedToken" : "gJ8yojTAkpMoTy9hY3djgVH43Spufnoo47Mk6sYsS9M="
              }
            ]
          },
          "email" : {
                  "verificationTokens" : [ ]
          }
        },
        "emails" : [
          {
            "address" : "loceehide_rose@hotmail.com",
            "verified" : true
          }
        ],
        "profile" : [
          {
            "firstname" : "roji",
            "middlename" : "",
            "lastname" : "",
            "mobile" : "",
            "home" : "",
            "address" : "",
            "secondaryemail" : "",
            "deleted" : 0,
            "isActive" : 1,
            "secondryemail" : "loceehide_rose@hotmail.com"
          }
        ]
      }]
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