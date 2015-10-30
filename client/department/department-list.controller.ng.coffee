'use strict'

angular.module 'etimesheetApp'
.controller 'DepartmentListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.department = $scope.$meteorCollection () ->
    Department.find {deleted:'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('department', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.departmentCount = $scope.$meteorObject Counts, 'numberOfDepartment', false

  $meteor.session 'departmentCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newDepartment.deleted="0"
    $scope.newDepartment.isAcitve="1"
    if $scope.form.$valid
      $scope.department.save $scope.newDepartment
      $scope.newDepartment = undefined
      
  $scope.remove = (departmentId) ->
    Meteor.call('departmentDelete',departmentId)

  
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
