'use strict'

angular.module 'etimesheetApp'
.controller 'LeaveRequestDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.leaveRequest = $scope.$meteorObject LeaveRequest, $stateParams.leaveRequestId
  $scope.$meteorSubscribe('leaveRequest')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.leaveRequest.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.leaveRequest.reset()
