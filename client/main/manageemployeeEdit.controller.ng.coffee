'use strict'
angular.module('etimesheetApp')
.controller 'ManageEmployeeEditCtrl', ($scope, $meteor, $state, $stateParams) ->
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  $scope.email=$scope.users[0].emails[0].address
  $scope.firstname=$scope.users[0].profile[0].firstname
  $scope.middlename=$scope.users[0].profile[0].middlename
  $scope.lastname=$scope.users[0].profile[0].lastname
  $scope.mobile=$scope.users[0].profile[0].mobile
  $scope.home=$scope.users[0].profile[0].home
  $scope.address=$scope.users[0].profile[0].address
  $scope.secondaryemail=$scope.users[0].profile[0].secondryemail
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.save = () ->
    console.log($stateParams.userId,$scope.email)
    Meteor.call('update', $stateParams.userId, $scope.email, $scope.firstname, $scope.middlename, $scope.lastname, $scope.mobile, $scope.home, $scope.address, $scope.secondaryemail)
    $state.go('manageemployee')