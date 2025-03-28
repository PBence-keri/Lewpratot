;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('myApp', [
    'ui.router',
    'app.common',
    'app.message',
    'app.user',
    'app.form',
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
              templateUrl: './html/navbar.html',
              controller: 'navbarController'
            }, 
            'footer@root': {
              templateUrl: './html/footer.html'
            },
            'modal@root': {
              template: `<ng-message></ng-message>`
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
          controller: 'rentalController'
        })
        .state('connection', {
          url: '/connection',
          parent: 'root',
          templateUrl: './html/connection.html',
          controller: 'connectionController'
        })
        .state('blog', {
          url: '/blog',
          parent: 'root',
          templateUrl: './html/blog.html',
          controller: 'blogController',
        })
        .state('login', {
          url: '/login',
          parent: 'root',
          templateUrl: './html/login.html',
          controller: 'loginController',
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
        })
        .state('profile', {
          url: '/profile',
          parent: 'root',
          templateUrl: './html/profile.html',
          controller: 'profileController'
        })

        .state('help', {
          url: '/help',
          parent: 'root',
          templateUrl: './html/connection.html',
          controller: 'helpController'
        });
        
      $urlRouterProvider.otherwise('/');
    }
  ])

  //Application run
  .run([  
    '$rootScope',
    'user',
    'util',
    'trans',
    ($rootScope, user, util, trans) => {

      trans.events(['login'], ['profile']);

      user.init({felhaszid:null}, () => {

        // When user properties exist, then set
        let user = util.localStorage("get", "user");
        if (user) $rootScope.user = util.objMerge($rootScope.user, user);
      });
    }
  ])

  //Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log("Home controller")
    }
  ])

  .controller('blogController', [
    '$scope',
    function($scope) {
      $scope.review = {
        name: '',
        email: '',
        rating: null,
        comment: ''
      };
    
      $scope.hoveredRating = 0;  

      $scope.setRating = function(star) {
        $scope.review.rating = star;
      };

    
      $scope.hoverRating = function(star) {
        $scope.hoveredRating = star;
      };

    
      $scope.resetStars = function() {
        $scope.hoveredRating = 0;
      };

    
      $scope.submitReview = function() {
        if ($scope.reviewForm.$valid) {
          console.log('Review submitted', $scope.review);
          alert('Köszönjük az értékelést!');
          $scope.review = { name: '', email: '', rating: null, comment: '' }; 
        }
      };
      console.log("Home controller")
    }
  ])

  // Navbar controller
  .controller('navbarController', [
    '$scope',
    function($scope) {
      console.log("Navbar controller")
    }
  ])

  //Rental controller
  .controller('rentalController', [
    '$scope',
    'http',
    function($scope, http) {
      
      // Kezdetben rejtve van a div
      $scope.showDiv = false;

      // Funkció, amely változtatja a div láthatóságát
      $scope.toggleDiv = function() {
        $scope.showDiv = !$scope.showDiv;
      };

      $scope.model = {brand: 0};
      http.request('./php/card.php')
      .then(response => {
        $scope.cars = response.cars;
        $scope.markak = response.markak;
        $scope.$applyAsync();
      })
      .catch(e=>console.log(e));
    }
  ])

  //Rent controller
  .controller('rentController', [
    '$state',
    '$scope',
    '$rootScope',
    '$stateParams',
    'http',
    function($state, $scope, $rootScope, $stateParams, http) {

           // Set local methods
           let methods = {

            // Initialize
            init: () => {
    
              $scope.data = $stateParams.data;
              if (!$scope.data) {
                $state.go('rental');
                return;
              }
              felvdatum.min = new Date().toISOString().split("T")[0];
              leaddatum.min = new Date().toISOString().split("T")[0];

            }
          };
    
          // Set scope methods
          $scope.methods = {
    
            // Register
            rent: () => {
              console.log($scope.data)
              let rentData = {
                'felhaszid': $rootScope.user.felhaszid,
                'vegosszeg': $scope.data.ar,
                'felvhely': $scope.model.felvhely,
                'leadhely': $scope.model.leadhely,
                'felvdatum': $scope.model.felvdatum,
                'leaddatum': $scope.model.leaddatum,
                'jarmuid': $scope.data.jarmuid
              }
              console.log(rentData)

              http.request({
                method: 'POST',
                url: './php/rent.php',
                data: rentData
              })
              .then(function(response) {
                console.log('Response:', response);
                if (response.affectedRows) {
                  $scope.model.felvhely = "";
                  $scope.model.leadhely = "";
                  $scope.model.felvdatum = "";
                  $scope.model.leaddatum = "";
                }
              })
              .catch(function(error) {
                msg.error(error.message || error);
              });
            }
          }
      methods.init();

    }
  ])

  //Help controller
  .controller('helpController', [
    'http',
    'util',
    '$state',
    '$scope',
    
    function(http, util, $state, $scope) {

      send: () => {
        // Set request
        http.request({
          url: "./php/help.php",
          data: $scope.model
        })
        .then(response => {
            response.email = $scope.model.email;
            user.set(response);
            util.localStorage('set', 'email', response.email);
            $state.go('home');  // Redirect to home page on successful login
        })
        .catch(e => {
          $scope.model.jelsz = null;
          msg.error(e.message || e);
        });
      }
    }
  ])

  //Login controller
  .controller('loginController', [
    '$state',
    '$scope',
    'form',
    'user',
    'util',
    'http',
    'msg',
    function($state, $scope, form, user, util, http, msg) {
    
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
            data: util.objFilterByKeys($scope.model, ['showPassword'], false)
          })
          .then(response => {
              response.email = $scope.model.email;
              user.set(response);
              util.localStorage('set', 'user', user.get());
          
              $state.go('home');  // Redirect to home page on successful login
          })
          .catch(e => {
            $scope.model.jelsz = null;
            msg.error(e.message || e);
          });
        }
      };
    
      // Initialize
      methods.init();
    }
  ])


  //Register controller
  .controller('registerController', [
    '$state',
    '$scope',
    'form',
    'msg',
    'util',
    'http',
    function($state, $scope, form, msg, util, http) {

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
              data.felhaszid = response.lastInsertId;

              // Save user email address
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

  //Profile controller
  .controller('profileController', [
    '$rootScope',
    '$scope',
    '$state',
    'util',
    'user',
    'http',
    'msg',
    function($rootScope, $scope, $state, util, user, http, msg) {

      http.request({
        url: './php/getUser.php',
        data: {felhaszid: $rootScope.user.felhaszid}
      })
      .then(response => {
        $scope.model = response;
        $scope.$applyAsync();
      })
      .catch(e => console.log(e));

      $scope.saveProperties = () => {
        let data = util.objMerge({}, $scope.model);
        data.felhaszid = $rootScope.user.felhaszid;

        let jelsz = $scope.model.jelsz;
        if (!jelsz) {
            msg.error("A mentéshez a jelenlegi jelszó megadása szükséges!");
            return;
        }

        console.log(data);

        let ujJelszo = $scope.model.jelszuj;
        let ujJelszoMegerosites = $scope.model.jelszuj2;

        console.log(ujJelszo) //azert null mert ng-pattern miatt nem jo az uj jelszo -> le kell ellenorizni button disablednel v idk
        console.log(ujJelszoMegerosites) //azert null mert ng-pattern miatt nem jo az uj jelszo -> le kell ellenorizni button disablednel v idk

        if (ujJelszo !== ujJelszoMegerosites) {
          msg.error("Az új jelszavak nem egyeznek!");
          return;
        }

        if (ujJelszo) {
          data.jelszuj = ujJelszo;
        }
    
        data.jelsz = jelsz;
        console.log(data)
    
        http.request({
            url: './php/profile.php',
            data: data
        })
        .then(response => {
          alert(response.message || "Az adatok sikeresen elmentve!");
            console.log(response);
            $state.go('home');
        })
        .catch(e => msg.error(e));
    };
    }
  ])

  //Connection controller
  .controller('connectionController', [
    '$scope',
    'http',
    function($scope, http) {
      $scope.connection = () => {
        http.request({
          url: './php/connection.php',
          data: $scope.model
        })
        .then(response => {
          console.log(response);
        })
        .catch(e => console.log(e));
      }
    }
  ])

})(window, angular); 