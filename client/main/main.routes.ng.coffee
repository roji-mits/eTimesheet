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

  .state 'not-verified',
    url: '/notverified/:userId'
    templateUrl: 'client/main/not-verified.view.html'
    controller: 'RegisterCtrl'
    


  .state 'reset-password',
    url: '/reset-password/:userId'
    templateUrl: 'client/main/reset-password.view.html'
    controller: 'ResetCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'leave',
    url: '/leave'
    templateUrl: 'client/main/leave.view.html'
    controller: 'LeaveCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'admin-dashboard',
    url: '/admin-dashboard'
    templateUrl: 'client/main/admin-dashboard.view.html'
    controller: 'AdminDashboardCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'manageemployee',
    url: '/manageemployee'
    templateUrl: 'client/main/manageemployee.view.html'
    controller: 'ManageEmployeeCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
    
  .state 'manageemployeeEdit',
    url: '/manageemployeeEdit/:userId'
    templateUrl: 'client/main/manageemployeeEdit.view.html'
    controller: 'ManageEmployeeEditCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'manageorganization',
    url: '/manageorganization'
    templateUrl: 'client/main/manageorganization.view.html'
    controller: 'ManageOrganizationCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'project',
    url: '/project'
    templateUrl: 'client/main/project.view.html'
    controller: 'ProjectCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'project-detail',
    url: '/project-detail/:projectId'
    templateUrl: 'client/main/project-detail.view.html'
    controller: 'ProjectDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'verify',
    url: '/verify-email/:verifyEmailToken'
    template: 'your mail is verified'
    controller:($stateParams, $meteor)->
      console.log($stateParams)
      console.log($stateParams.verifyEmailToken)
      Meteor.call('verifyEmail',$stateParams.verifyEmailToken)