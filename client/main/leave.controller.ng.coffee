'use strict'
angular.module('etimesheetApp')
.controller 'LeaveCtrl', ($scope, $meteor, $state) ->
  $scope.leaveRequest = $scope.$meteorCollection () ->
    LeaveRequest.find {}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leave')

  $scope.approve = (leaveRequestId)->
    console.log(leaveRequestId)
    Meteor.call('approve',leaveRequestId)
    sweetAlert({title:'Leave', text: "Approved!", type: "success"})

  $scope.cancelApproval = (leaveRequestId) ->
    console.log(leaveRequestId)
    Meteor.call('cancelApproval', leaveRequestId)
    sweetAlert({title:'Request', text: "Canceled!", type: "error"})