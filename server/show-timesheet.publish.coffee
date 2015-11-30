'use strict'

Meteor.publish 'showTimesheet', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfShowTimesheet', ShowTimesheet.find(where), noReady: true
  ShowTimesheet.find where, options