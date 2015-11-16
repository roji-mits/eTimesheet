'use strict'

angular.module('etimesheetApp')
.controller 'ProjectCtrl', ($scope, $meteor, $state) ->
  $scope.member=[]
  $scope.page = 1
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'profile.deleted':0}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.project = $scope.$meteorCollection () ->
    Project.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.projectsCount = $scope.$meteorObject Counts, 'numberOfProject', false

  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false
  
  $scope.exist=(users,list)->
    return list.indexOf(users) > -1

  $scope.toggle =  (users, list)->
    $scope.idx = list.indexOf(users)
    if($scope.idx > -1)
     list.splice($scope.idx, 1)
    else
     list.push(users)

  $scope.save = () ->
    console.log($scope.member)
    $scope.newProject.deleted="0"
    $scope.newProject.isActive="1"
    $scope.newProject.member=$scope.member
    if $scope.form.$valid
      $scope.project.save $scope.newProject
      alert('done!')
      document.getElementById("projectForm").reset()
      $scope.member=[]
      $scope.idx=0

  $scope.remove = (project) ->
    $scope.project.remove project

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)