'use strict'
angular.module('etimesheetApp')
.controller 'ManageEmployeeCtrl', ($scope, $meteor, $state, $stateParams) ->
  $scope.email=''
  $scope.password=''
  $scope.profile=[
      firstname:'',
      middlename:'',
      lastname:'',
      mobile:'',
      home:'',
      address:'',
      deleted:0,
      isActive:1

    ]
  $scope.page = 1
  $scope.perPage = 10
  $scope.sort = name : 1
  $scope.sortReverse = 'false'
  $scope.orderProperty = '1'
  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'profile.deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }).then () ->
      $scope.usersCount = $scope.$meteorObject Counts, 'numberOfUsers', false

  $meteor.session 'usersCounter'
  .bind $scope, 'page'

  $scope.register = () ->
    Accounts.createUser({email:$scope.email, password:$scope.password, profile:$scope.profile}, (error)->
      if(error)
        console.log(error)
      else
        console.log('success')
        console.log($scope.users[0].emails[0].verified)
        $scope.verified=$scope.users[0].emails[0].verified
        Meteor.call('verification', Meteor.userId(), $scope.verified)
        console.log($scope.users[0].emails[0].verified)

        document.getElementById("registerForm").reset();

      )
  $scope.verify =(user) ->
    console.log($scope.users[0].emails[0].verified)
    Meteor.call('adminVerify', user)

  $scope.deactive =(user) ->
    Meteor.call('deactive', user)

  $scope.active =(user) ->
    Meteor.call('active', user)

  $scope.remove = (user) ->
    console.log(user)
    Meteor.call('remove',user)

