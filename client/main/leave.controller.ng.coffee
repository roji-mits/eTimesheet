'use strict'
angular.module('etimesheetApp')
.controller 'LeaveCtrl', ($scope, $meteor, $state) ->
  $scope.leaveRequest = $scope.$meteorCollection () ->
    LeaveRequest.find {}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequest')