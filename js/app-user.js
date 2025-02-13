;(function(window, angular) {

  'use strict';

  // Application user module
  angular.module('app.user', [
    'app.common',
		'app.message',
  ])

	// User factory
  .factory('user', [
    '$rootScope',
    '$state',
    'util',
    'msg',
    ($rootScope, $state, util, msg) => {

      // Set local methods
      let methods = {

        // Default user properties
        default: () => {
          return {
            felhaszid   : null,
            vezeteknev  : null,
            kozepsonev  : null,
            keresztnev  : null,
            nem         : null,
            email       : null 
          };
        }
      };

      // Set service
      let service = {

        // Initialize
        init: () => {

          // Set user default properties
          $rootScope.user = util.objMerge({}, methods.default());
        },

        // Set
        set: (data) => {
          Object.keys(methods.default()).forEach(key => {
            if (util.hasKey(data, key)) $rootScope.user[key] = data[key];
          });
          $rootScope.$applyAsync();
        },

        // Reset
        reset: (filter=null) => {
          if (util.isString(filter)) filter = filter.split(',');
          if (!util.isArray(filter)) filter = [];
          Object.keys($rootScope.user).forEach(key => {
            if (!filter.includes(key)) $rootScope.user[key] = null;
          });
          $rootScope.$applyAsync();
        }
      };

      // Logout
      $rootScope.logout = () => {
        msg.show({
          icon      : "text-primary fa-solid fa-circle-question",
          content   : "Biztosan kijelentkezik?",
          isConfirm	: true,
          callback  : (response) => {
            if (response === 'ok') {
              service.reset('email');
              if ($rootScope.state.disabled.includes($rootScope.state.felhaszid))
                $state.go($rootScope.state.default);
            }
          }
        });
      };

      // Return service
      return service;
    }
  ]);

})(window, angular);