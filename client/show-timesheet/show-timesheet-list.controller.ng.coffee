'use strict'

angular.module 'etimesheetApp'
.controller 'ShowTimesheetListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  

  $scope.dailyLogs = $scope.$meteorCollection () ->
    DailyLog.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLog', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.dailyLogCount = $scope.$meteorObject Counts, 'numberOfDailyLog', false

  $meteor.session 'dailyLogCounter'
  .bind $scope, 'page'
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)

