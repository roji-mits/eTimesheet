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
  $scope.empdepartment=$scope.users[0].profile[0].department
  $scope.empdesignation=$scope.users[0].profile[0].designation
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.designation = $scope.$meteorCollection () ->
    Designation.find {'deleted':'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designation')

  $scope.department = $scope.$meteorCollection () ->
    Department.find {'deleted':'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('department')

  $scope.save = () ->
    console.log($stateParams.userId,$scope.email)
    Meteor.call('update', $stateParams.userId, $scope.email, $scope.firstname, $scope.middlename, $scope.lastname, $scope.mobile, $scope.home, $scope.address, $scope.secondaryemail, $scope.designation, $scope.department)
    $state.go('manageemployee')