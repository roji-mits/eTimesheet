'use strict'

Meteor.publish 'dailyLog', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDailyLog', DailyLog.find({'deleted':0}), noReady: true
  DailyLog.find where, options