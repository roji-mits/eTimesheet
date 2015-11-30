'use strict'

angular.module 'etimesheetApp'
.controller 'OrganizationDetailCtrl', ($scope, $stateParams, $meteor,$state) ->
  $scope.organization = $scope.$meteorObject Organization, $stateParams.organizationId
  $scope.$meteorSubscribe('organization')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organization.save().then(
        (numberOfDocs) ->
          $state.go('organization-list')
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.organization.reset()
