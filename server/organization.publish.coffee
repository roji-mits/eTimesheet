'use strict'

Meteor.publish 'organization', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfOrganization', Organization.find({'deleted':'0'}), noReady: true
  Organization.find where, options