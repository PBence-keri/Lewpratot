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