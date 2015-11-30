'use strict'

angular.module 'etimesheetApp'
.controller 'DailyLogListCtrl', ($scope, $meteor, $rootScope) ->
  $scope.dataOwner= Meteor.userId()
  $scope.timesheets=[]
  $scope.page = 1
  $scope.perPage = 4
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  


  $scope.dailyLog = $scope.$meteorCollection () ->
    DailyLog.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLog', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    },(owner:$scope.dataOwner), $scope.getReactively('search')).then () ->
      $scope.dailyLogCount = $scope.$meteorObject Counts, 'numberOfDailyLog', false

  
  $scope.project = $scope.$meteorCollection () ->
    Project.find {"member.emails.0.address":$rootScope.currentUser.emails[0].address}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project')
  console.log($rootScope.currentUser.emails[0].address)


  $meteor.session 'dailyLogCounter'
  .bind $scope, 'page'

  $scope.add = () ->
    $scope.timesheets.push({name:$scope.newdailyLog.name, time:$scope.newdailyLog.time, description:$scope.newdailyLog.description, employee:$rootScope.currentUser.profile[0].firstname})
    $scope.newdailyLog= undefined
  
  $scope.save = () ->
    $scope.newdailyLog=$scope.timesheets
    $scope.newdailyLog.savedDate= new Date()
    $scope.dailyLog.save $scope.newdailyLog
    $scope.newdailyLog = undefined
    $scope.timesheets=[]
    console.log($scope.dailyLog)
      
  $scope.remove = (dailyLog) ->
    $scope.dailyLog.remove dailyLog
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
