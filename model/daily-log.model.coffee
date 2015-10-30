@DailyLog = new Mongo.Collection('dailyLog')

DailyLog.allow
  insert: (userId, dailyLog) ->
    true
  update: (userId, dailyLog, fields, modifier) ->
    true
  remove: (userId, dailyLog) ->
    true
