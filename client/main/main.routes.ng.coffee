'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'
  .state 'register',
    url: '/register'
    templateUrl: 'client/main/register.view.html'
    controller: 'RegisterCtrl'
  .state 'logout',
    url: '/logout'
    resolve:
      "logout": ['$meteor', '$state', ($meteor, $state) -> 
        return $meteor.logout().then( -> 
          $state.go('main');
        , (err) -> 
          console.log('logout error - ', err);
        )
      ]

   .state 'home',
    url: '/home'
    resolve:
      "home": ['$meteor', '$state', ($meteor, $state) -> 
        return $meteor.home().then( -> 
          if(currentUser=='loceehide_rose@hotmail.com')
            $state.go('admin-dashboard')
          else
            $state.go('employee-dashboard')
        )
      ]

  .state 'not-verified',
    url: '/notverified/:userId'
    templateUrl: 'client/main/not-verified.view.html'
    controller: 'RegisterCtrl'

  .state 'leave',
    url: '/leave'
    templateUrl: 'client/main/leave.view.html'
    controller: 'LeaveCtrl'

  .state 'timesheet',
    url: '/timesheet'
    templateUrl: 'client/main/timesheet.view.html'
    controller: 'TimesheetCtrl'

  .state 'user-dashboard',
    url: '/user-dashboard/:userId'
    templateUrl: 'client/main/user-dashboard.view.html'
    controller: 'UserDashboardCtrl'

  .state 'admin-dashboard',
    url: '/admin-dashboard'
    templateUrl: 'client/main/admin-dashboard.view.html'
    controller: 'AdminDashboardCtrl'

  .state 'manageemployee',
    url: '/manageemployee'
    templateUrl: 'client/main/manageemployee.view.html'
    controller: 'ManageEmployeeCtrl'
    
  .state 'manageemployeeEdit',
    url: '/manageemployeeEdit/:userId'
    templateUrl: 'client/main/manageemployeeEdit.view.html'
    controller: 'ManageEmployeeEditCtrl'

  .state 'manageorganization',
    url: '/manageorganization'
    templateUrl: 'client/main/manageorganization.view.html'
    controller: 'ManageOrganizationCtrl'

  .state 'project',
    url: '/project'
    templateUrl: 'client/main/project.view.html'
    controller: 'ProjectCtrl'