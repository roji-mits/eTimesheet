@ShowTimesheet = new Mongo.Collection('showTimesheet')

ShowTimesheet.allow
  insert: (userId, showTimesheet) ->
    userId
  update: (userId, showTimesheet, fields, modifier) ->
    userId
  remove: (userId, showTimesheet) ->
    userId
