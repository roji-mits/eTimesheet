'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'organization-list',
    url: '/organization'
    templateUrl: 'client/organization/organization-list.view.html'
    controller: 'OrganizationListCtrl'
  .state 'organization-detail',
    url: '/organization/:organizationId'
    templateUrl: 'client/organization/organization-detail.view.html'
    controller: 'OrganizationDetailCtrl'
