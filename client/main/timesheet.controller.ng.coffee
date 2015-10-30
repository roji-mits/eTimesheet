'use strict'
angular.module('etimesheetApp')
.controller 'TimesheetCtrl', ($scope, $meteor, $state) ->
  $scope.dailyLog = $scope.$meteorCollection () ->
    DailyLog.find {}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLog')