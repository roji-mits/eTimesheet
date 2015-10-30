'use strict'

Meteor.publish 'leaveRequest', (options, searchString) ->
  where =
    'leaveReason':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfLeaveRequest', LeaveRequest.find({'deleted':0}), noReady: true
  LeaveRequest.find where, options