Meteor.startup ->
  if Organization.find().count() == 0
    organization = [
      {
        'name': 'organization 1'
      }
      {
        'name': 'organization 2'
      }
    ]
    organization.forEach (organization) ->
      Organization.insert organization