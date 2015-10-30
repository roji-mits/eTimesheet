'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'dailyLog-list',
    url: '/daily-log'
    templateUrl: 'client/daily-log/daily-log-list.view.html'
    controller: 'DailyLogListCtrl'
  .state 'dailyLog-detail',
    url: '/daily-log/:dailyLogId'
    templateUrl: 'client/daily-log/daily-log-detail.view.html'
    controller: 'DailyLogDetailCtrl'
