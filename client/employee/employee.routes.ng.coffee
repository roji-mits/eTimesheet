'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'employee-list',
    url: '/employee/:userId'
    templateUrl: 'client/employee/employee-list.view.html'
    controller: 'EmployeeListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'employee-detail',
    url: '/employee/:employeeId'
    templateUrl: 'client/employee/employee-detail.view.html'
    controller: 'EmployeeDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'employee-dashboard',
    url: '/employee'
    templateUrl: 'client/employee/employee-dashboard.view.html'
    controller: 'EmployeeDashboardCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
