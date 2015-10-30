Meteor.startup ->
  if DailyLog.find().count() == 0
    dailyLog = [
      {
        'name': 'dailyLog 1'
      }
      {
        'name': 'dailyLog 2'
      }
    ]
    dailyLog.forEach (dailyLog) ->
      DailyLog.insert dailyLog