@Organization = new Mongo.Collection('organization')

Organization.allow
  insert: (userId, organization) ->
    true
  update: (userId, organization, fields, modifier) ->
    true
  remove: (userId, organization) ->
    true
