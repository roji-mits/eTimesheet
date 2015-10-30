'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'department-list',
    url: '/department'
    templateUrl: 'client/department/department-list.view.html'
    controller: 'DepartmentListCtrl'
  .state 'department-detail',
    url: '/department/:departmentId'
    templateUrl: 'client/department/department-detail.view.html'
    controller: 'DepartmentDetailCtrl'
