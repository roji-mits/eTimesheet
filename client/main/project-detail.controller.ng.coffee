'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectDetailCtrl', ($scope, $meteor, $rootScope, $state, $stateParams, $meteorObject) ->
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'profile.deleted':0}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.project = $scope.$meteorCollection () ->
    Project.find {}
  $scope.project = $scope.$meteorObject Project, $stateParams.projectId
  $scope.$meteorSubscribe('project')
  console.log($scope.project)

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
    if $scope.form.$valid
      $scope.project.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'project'
        (error) ->
          console.log 'save error ', error
      )
    $state.go 'project'
        
  $scope.reset = () ->
    $scope.project.reset()