'use strict'

Meteor.publish 'dailyLog', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDailyLog', DailyLog.find(), noReady: true
  DailyLog.find where, options