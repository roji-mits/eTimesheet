Meteor.startup ->
  if ShowTimesheet.find().count() == 0
    showTimesheet = [
      {
        'name': 'showTimesheet 1'
      }
      {
        'name': 'showTimesheet 2'
      }
    ]
    showTimesheet.forEach (showTimesheet) ->
      ShowTimesheet.insert showTimesheet