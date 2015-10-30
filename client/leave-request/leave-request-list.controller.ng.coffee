'use strict'

angular.module 'etimesheetApp'
.controller 'LeaveRequestListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 5
  $scope.sort = name : 1
  $scope.sortReverse = 'false'
  $scope.orderProperty = '1'
  
  $scope.leaveRequest = $scope.$meteorCollection () ->
    LeaveRequest.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequest', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.leaveRequestCount = $scope.$meteorObject Counts, 'numberOfLeaveRequest', false

  $meteor.session 'leaveRequestCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newLeaveRequest.user= $scope.currentUser.profile[0].firstname
    if $scope.form.$valid

      $scope.leaveRequest.save $scope.newLeaveRequest
      $scope.newLeaveRequest = undefined

  $scope.remove = (leaveRequest) ->
    $scope.leaveRequest.remove leaveRequest
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)