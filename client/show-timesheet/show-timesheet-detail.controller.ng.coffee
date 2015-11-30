'use strict'

angular.module 'etimesheetApp'
.controller 'ShowTimesheetDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.showTimesheet = $scope.$meteorObject ShowTimesheet, $stateParams.showTimesheetId
  $scope.$meteorSubscribe('showTimesheet')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.showTimesheet.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.showTimesheet.reset()
