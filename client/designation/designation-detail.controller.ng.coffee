'use strict'

angular.module 'etimesheetApp'
.controller 'DesignationDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.designation = $scope.$meteorObject Designation, $stateParams.designationId
  $scope.$meteorSubscribe('designation')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.designation.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
      $state.go('designation-list')
        
  $scope.reset = () ->
    $scope.designation.reset()
