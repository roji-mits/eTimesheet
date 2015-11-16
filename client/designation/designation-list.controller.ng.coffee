'use strict'

angular.module 'etimesheetApp'
.controller 'DesignationListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.designation = $scope.$meteorCollection () ->
    Designation.find {'deleted':'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designation', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.designationCount = $scope.$meteorObject Counts, 'numberOfDesignation', false

  $meteor.session 'designationCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newDesignation.deleted='0'
    $scope.newDesignation.isActive='1'
    if $scope.form.$valid
      $scope.designation.save $scope.newDesignation
      $scope.newDesignation = undefined
      
  $scope.delete = (designationId) ->
    console.log(designationId)
    Meteor.call('delete', designationId)

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
