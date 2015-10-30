'use strict'

angular.module('etimesheetApp').controller 'RegisterCtrl', ($scope, $meteor, $state) ->
    $scope.email=''
    $scope.password=''
    $scope.profile=[
      firstname:'',
      middlename:'',
      lastname:'', 
      mobile:'',
      home:'',
      address:'',
      secondaryemail:''
      deleted:0
      isActive:1
      ]

    $scope.user = $scope.$meteorCollection () ->
      Meteor.users.find {}

    $scope.register = () ->
      
      
      Accounts.createUser({email:$scope.email, password:$scope.password, profile:$scope.profile}, (error)->
        if(error)
          console.log(error)
        else
          console.log('success')
          $scope.verificationState = $scope.user[0].emails[0].verified
          console.log($scope.verificationState)
          $scope.emailToVerify = $scope.user[0].emails[0].address
          console.log($scope.emailToVerify)
          console.log($scope.password)
          if($scope.verificationState==false)
            Meteor.call('chckEmail', Meteor.userId(),$scope.emailToVerify, $scope.password)
            $state.go('not-verified',{userId: Meteor.userId()})
          else
            $state.go('main')
        )


