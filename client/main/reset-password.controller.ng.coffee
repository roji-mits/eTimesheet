'use strict'

angular.module('etimesheetApp').controller 'ResetCtrl',
 ['$scope', '$meteor', '$stateParams', '$state','$window', ($scope, $meteor, $stateParams, $state) ->

    $scope.resetpw = () ->
      console.log($stateParams.userId)
      Meteor.call('resetpw', $stateParams.userId,$scope.newPlaintextPassword)
      console.log("success")
      $state.go('manageemployee')
      sweetAlert({title: "yep!", text: "password changed!", type: "success"})

    $scope.cancel = () ->
      $state.go('manageemployee')
  ]