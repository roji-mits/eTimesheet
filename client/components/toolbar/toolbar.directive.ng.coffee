'use strict'

angular.module 'etimesheetApp'
.directive 'toolbar', ->
  restrict: 'AE'
  templateUrl: 'client/components/toolbar/toolbar.view.html'
  replace: true
.controller 'toolCtrl',($scope )->
  $scope.user=(user)->
    if user =='loceehide_rose@hotmail.com'
      return false
    else
      return true




