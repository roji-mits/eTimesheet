'use strict'

Meteor.publish 'dailyLog', (options, searchString) ->
  where =
    '_id':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDailyLog', DailyLog.find(), noReady: true
  DailyLog.find where, options