Meteor.startup ->
  if Organization.find().count() == 0
    organization = [
      {
        'name': 'organization 1'
        'deleted':'0'
      }
      {
        'name': 'organization 2'
        'deleted':'0'
      }
    ]
    organization.forEach (organization) ->
      Organization.insert organization