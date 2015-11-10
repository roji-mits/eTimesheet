Meteor.startup ->
  if Designation.find().count() == 0
    designation = [
      {
        'name': 'designation 1'
        'deleted':'0'
      }
      {
        'name': 'designation 2'
        'deleted':'0'
      }
    ]
    designation.forEach (designation) ->
      Designation.insert designation