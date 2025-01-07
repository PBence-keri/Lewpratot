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
        .state('root', {
          views: {
            '': {
              templateUrl: './html/root.html'
            }, 
            'header@root': {
              templateUrl: './html/navbar.html'
            }, 
            'footer@root': {
              templateUrl: './html/footer.html'
            }
          }
        })

        .state('home', {
          url: '/',
          parent: 'root',
          templateUrl: './html/home.html',
          controller: 'homeController'
        });

        $stateProvider
          .state('page1', {
            url: '/page1',
            parent: 'root',
            templateUrl: './html/page1.html',
          })

          .state('page2', {
            url: '/page2',
            parent: 'root',
            templateUrl: './html/page2.html',
          })

          .state('page3', {
            url: '/page3',
            parent: 'root',
            templateUrl: './html/page3.html',
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
      console.log("Home controller")
    }
  ])

  

})(window, angular);
