;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('myApp', [
    'ui.router',
    'app.common',
    'app.message',
    'app.user',
		'app.form'
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
        })
        .state('rental', {
          url: '/rental',
          parent: 'root',
          templateUrl: './html/rental.html',
          controller: 'page1Controller'
        })
        .state('connection', {
          url: '/connection',
          parent: 'root',
          templateUrl: './html/connection.html',
        })
        .state('blog', {
          url: '/blog',
          parent: 'root',
          templateUrl: './html/blog.html',
        })
        .state('login', {
          url: '/login',
          parent: 'root',
          templateUrl: './html/login.html',
          controller: 'loginController'
        })
        .state('register', {
          url: '/register',
          parent: 'root',
          templateUrl: './html/register.html',
          controller: 'registerController'
        })
        .state('rent', {
          url: '/rent',
          parent: 'root',
          templateUrl: './html/rent.html',
          controller: 'rentController',
          params: {
            data: null
          }
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

  // Rent controller
  .controller('rentController', [
    '$state',
    '$scope',
		'$stateParams',
    function($state, $scope, $stateParams) {

			// Get/Check parameters
      $scope.data = $stateParams.data;
      if (!$scope.data) {
        $state.go('home');
        return;
      }

      console.log($scope.data);
    }
  ])

  // Login
  .controller('loginController', [
    '$state',
    '$rootScope',
    '$scope',
    'form',
    'user',
    'util',
    'http',
    'trans',
    'msg',
    function($state, $rootScope, $scope, form, user, util, http, trans, msg) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          // Set email address from local storage if exist
          $scope.model = {email: util.localStorage('get', 'email')};

          // Set focus
					form.focus();
        }
      };

      // Set scope methods
      $scope.methods = {

        login: () => {
          // Set request
          http.request({
            url: "./php/login.php",
            data: util.objFilterByKeys($scope.model, 'showPassword', false)
          })
          .then(response => {
            response.email = $scope.model.email;
            user.set(response);
            util.localStorage('set', 'email', response.email);
            console.log("asd");
            trans.preventState();
          })
          .catch(e => {
            $scope.model.password = null;
            msg.error(e);
          });
        },
      };

      // Initialize
      methods.init();
    }
  ])

  //Register controller
  .controller('registerController', [
    '$state',
    '$rootScope',
    '$scope',
    'form',
    'msg',
    'util',
    'http',
    'user',
    function($state, $rootScope, $scope, form, msg, util, http, user) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          // Set focus
					form.focus();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Register
        register: () => {

          // Remove unnecessary data
          let data  = util.objFilterByKeys($scope.model, [
                        'showPassword', 
                        'megerosites'
                      ], false);

          // Check data has born property
          if (util.isObjectHasKey(data, 'szulev') && data.szulev)  
            data.szulev = moment(data.szulev).format('YYYY-MM-DD');

          console.log(data);

          // Http request
          http.request({
            method: "POST",
            url: "./php/register.php",
            data: data
          })

          .then(response => {

            // Check response
            if (response.affectedRows) {

              // Remove unnecessary data
              delete data.jelsz;
              delete data.szulev;

              // Initialize missing data
              data.id = response.lastInsertId;

              // Set user properties, and save email address
              user.set(data);
              util.localStorage('set', 'email', data.email);

              // Show result
              msg.show({
                icon      : "text-success fa-solid fa-check",
                content   : "Sikeres regisztráció!",
                callback  : () => {

                  // Go to dafault page
                  $state.go('home');
                }
              });
            } else msg.error("Sikertelen regisztráció!");
          })
          .catch(e => msg.error(e));
        },
      };
      // Initialize
      methods.init();
    }
  ])

})(window, angular); 


