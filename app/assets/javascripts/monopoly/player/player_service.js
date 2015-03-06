var app = angular.module("monopolyApp.player", []);

app.service('PlayerService', function($http, $q, $stateParams) {
  var id = null;

  function fetchIdFromServer() {
    return $http.post('/api/lobby/register');
  }

  this.getId = function() {
    var deferred = $q.defer();

    if (id) {
      deferred.resolve({ id: id });
    } else if($stateParams.id) {
      id = $stateParams.id;
      deferred.resolve({ id: id });
    } else {
      fetchIdFromServer().then(function(response) {
        id = response.data.id;

        deferred.resolve({ id: id });
      });
    }

    return deferred.promise;
  };
});

