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
          url: '/',
          templateUrl: './html/page1.html',
          controller: 'page1Controller'
        });

        $stateProvider
        .state('page2', {
          url: '/',
          templateUrl: './html/page2.html',
          controller: 'page2Controller'
        });

        $stateProvider
        .state('page3', {
          url: '/',
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
      $rootScope.feliratkozas = () => {
        alert('asdasdasd!');
      }
    }
  ])

  // Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      
    }
  ])

  

})(window, angular);