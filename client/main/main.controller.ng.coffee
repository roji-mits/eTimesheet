'use strict'

angular.module 'etimesheetApp'
.controller 'MainCtrl', ($scope, $meteor, $state) ->

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'profile.deleted':0}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users')
  $scope.login = ->
    $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
      if($scope.credentials.email=='roji@makeitsimple.info' && $scope.credentials.password=='password')
          $state.go 'admin-dashboard'
        else
          if($scope.currentUser.emails[0].verified==true && $scope.currentUser.profile[0].isActive == 1)
            console.log($scope.currentUser.profile[0].isActive)
            $state.go 'employee-dashboard'
          else
            console.log($scope.currentUser.emails[0].verified)
            sweetAlert({title: "Please Verify!", text: "Or Activate", type: "error"})
            return $meteor.logout().then( ->
              $state.go('main')
            , (err) ->
              console.log('logout error - ', err)
            )
          
      ), (err) ->
        $scope.error = 'Login error - ' + err 
  $scope.image =[{ src: 'client/img/manageemployee.jpg'}]

    

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
