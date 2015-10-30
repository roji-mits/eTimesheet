@Department = new Mongo.Collection('department')

Department.allow
  insert: (userId, department) ->
    true
  update: (userId, department, fields, modifier) ->
    true
  remove: (userId, department) ->
    true
