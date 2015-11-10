Meteor.startup ->
  if Department.find().count() == 0
    department = [
      {
        'name': 'department 1'
        'deleted':'0'
      }
      {
        'name': 'department 2'
        'deleted':'0'
      }
    ]
    department.forEach (department) ->
      Department.insert department