'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'designation-list',
    url: '/designation'
    templateUrl: 'client/designation/designation-list.view.html'
    controller: 'DesignationListCtrl'
  .state 'designation-detail',
    url: '/designation/:designationId'
    templateUrl: 'client/designation/designation-detail.view.html'
    controller: 'DesignationDetailCtrl'
