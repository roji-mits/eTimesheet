'use strict'

Meteor.publish 'project', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfProject', Project.find(), noReady: true
  Project.find where, options
