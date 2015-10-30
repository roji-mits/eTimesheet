@Designation = new Mongo.Collection('designation')

Designation.allow
  insert: (userId, designation) ->
    true
  update: (userId, designation, fields, modifier) ->
    true
  remove: (userId, designation) ->
    true
