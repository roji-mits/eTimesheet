'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'leaveRequest-list',
    url: '/leave-request'
    templateUrl: 'client/leave-request/leave-request-list.view.html'
    controller: 'LeaveRequestListCtrl'
  .state 'leaveRequest-detail',
    url: '/leave-request/:leaveRequestId'
    templateUrl: 'client/leave-request/leave-request-detail.view.html'
    controller: 'LeaveRequestDetailCtrl'
