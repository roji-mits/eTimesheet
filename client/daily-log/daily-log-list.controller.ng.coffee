'use strict'

angular.module 'etimesheetApp'
.controller 'DailyLogListCtrl', ($scope, $meteor, $rootScope) ->
  $scope.timesheets=[]
  $scope.page = 1
  $scope.perPage = 100
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.dailyLog = $scope.$meteorCollection () ->
    DailyLog.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLog', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.dailyLogCount = $scope.$meteorObject Counts, 'numberOfDailyLog', false

  $scope.project = $scope.$meteorCollection () ->
    Project.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project')


  $meteor.session 'dailyLogCounter'
  .bind $scope, 'page'

  $scope.add = () ->
    $scope.timesheets.push({name:$scope.newdailyLog.name, time:$scope.newdailyLog.time, description:$scope.newdailyLog.description, employee:$rootScope.currentUser.profile[0].firstname})
    $scope.newdailyLog= undefined
  
  $scope.save = () ->
    $scope.newdailyLog=$scope.timesheets
    $scope.dailyLog.save $scope.newdailyLog
    $scope.newdailyLog = undefined
    $scope.timesheets = undefined
    console.log($scope.dailyLog)
      
  $scope.remove = (dailyLog) ->
    $scope.dailyLog.remove dailyLog
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)