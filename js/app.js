;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('myApp', [
    'ui.router'
  ])

  // Application config
  .config([
    '$stateProvider', 
    '$urlRouterProvider', 
    ($stateProvider, $urlRouterProvider) => {

      $stateProvider
        .state('home', {
          url: '/',
          templateUrl: './html/home.html',
          controller: 'homeController'
        });

        $stateProvider
          .state('page1', {
            url: '/page1',
            templateUrl: './html/page1.html',
            controller: 'page1Controller'
          })

          .state('page2', {
            url: '/page2',
            templateUrl: './html/page2.html',
            controller: 'page2Controller'
          })

          .state('page3', {
            url: '/page3',
            templateUrl: './html/page3.html',
            controller: 'page3Controller'
          });
        
      $urlRouterProvider.otherwise('/');
    }
  ])

  // Application run
  .run([  
    '$rootScope',
    ($rootScope) => {
      
    }
  ])

  // Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      
    }
  ])

  

})(window, angular);