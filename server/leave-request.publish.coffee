'use strict'

Meteor.publish 'leaveRequest', (options, checkOwner, searchString) ->
  where =
    'leaveReason':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'owner':checkOwner.owner
  Counts.publish this, 'numberOfLeaveRequest', LeaveRequest.find({checkOwner}), noReady: true
  LeaveRequest.find where, options

Meteor.publish 'leave', (options, searchString) ->
  where =
    'leaveReason':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfLeaveRequest', LeaveRequest.find(), noReady: true
  LeaveRequest.find where, options