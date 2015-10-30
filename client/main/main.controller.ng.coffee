'use strict'

angular.module 'etimesheetApp'
.controller 'MainCtrl', ($scope, $meteor, $state) ->
  $scope.login = ->
      $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
        if($scope.credentials.email=='loceehide_rose@hotmail.com' && $scope.credentials.password=='loceehide_rose@hotmail.com')
          $state.go 'admin-dashboard'
        else 
          $state.go 'employee-dashboard'
      ), (err) ->
        $scope.error = 'Login error - ' + err 

  # $scope.page = 1
  # $scope.perPage = 3
  # $scope.sort = name_sort : 1
  # $scope.orderProperty = '1'
  
  # $scope.things = $scope.$meteorCollection () ->
  #   Things.find {}, {sort:$scope.getReactively('sort')}
  # $meteor.autorun $scope, () ->
  #   $scope.$meteorSubscribe('things', {
  #     limit: parseInt($scope.getReactively('perPage'))
  #     skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
  #     sort: $scope.getReactively('sort')
  #   }, $scope.getReactively('search')).then () ->
  #     $scope.thingsCount = $scope.$meteorObject Counts, 'numberOfThings', false

  # $meteor.session 'thingsCounter'
  # .bind $scope, 'page'
    
  # $scope.save = () ->
  #   if $scope.form.$valid
  #     $scope.things.save $scope.newThing
  #     $scope.newThing = undefined
      
  # $scope.remove = (thing) ->
  #   $scope.things.remove thing
    
  # $scope.pageChanged = (newPage) ->
  #   $scope.page = newPage
    
  # $scope.$watch 'orderProperty', () ->
  #   if $scope.orderProperty
  #     $scope.sort = name_sort: parseInt($scope.orderProperty)
