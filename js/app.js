;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('myApp', [
    'ui.router',
    'app.common'
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
            controller: 'page1Controller'
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
          })

          .state('login', {
            url: '/login',
            parent: 'root',
            templateUrl: './html/login.html',
          })

          .state('register', {
            url: '/register',
            parent: 'root',
            templateUrl: './html/register.html',
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

  // Page1 controller
  .controller('page1Controller', [
    '$scope',
    'http',
    function($scope, http) {
      http.request('./php/card.php')
      .then(cars => {
        $scope.cars = cars;
        $scope.$applyAsync();
      })
      .catch(e=>console.log(e));
    }
  ])

})(window, angular);