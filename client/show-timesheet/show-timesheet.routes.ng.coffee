'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'showTimesheet-list',
    url: '/show-timesheet'
    templateUrl: 'client/show-timesheet/show-timesheet-list.view.html'
    controller: 'ShowTimesheetListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'showTimesheet-detail',
    url: '/show-timesheet/:showTimesheetId'
    templateUrl: 'client/show-timesheet/show-timesheet-detail.view.html'
    controller: 'ShowTimesheetDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
