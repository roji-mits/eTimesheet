Meteor.startup ->
  if Employee.find().count() == 0
    employee = [
      {
        'name': 'employee 1'
      }
      {
        'name': 'employee 2'
      }
    ]
    employee.forEach (employee) ->
      Employee.insert employee