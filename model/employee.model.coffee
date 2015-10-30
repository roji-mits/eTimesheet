@Employee = new Mongo.Collection('employee')

Employee.allow
  insert: (userId, employee) ->
    userId
  update: (userId, employee, fields, modifier) ->
    userId
  remove: (userId, employee) ->
    userId
