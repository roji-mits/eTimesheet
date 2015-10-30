'use strict'

angular.module 'etimesheetApp'
.controller 'EmployeeDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.employee = $scope.$meteorObject Employee, $stateParams.employeeId
  $scope.$meteorSubscribe('employee')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.employee.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.employee.reset()
