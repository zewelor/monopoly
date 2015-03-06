var app = angular.module("monopolyApp.lobby");

app.service('LobbyService', function($http, $q, PlayerService) {
  function getGame(playerId) {
    return $http.get('/api/lobby/new_game', { params: { id: playerId } })
  }

  this.findGame = function() {
    var deferred = $q.defer();

    PlayerService.getId().then(function(response) {
      return getGame(response.id)
    }).then(function(response) {
      var id = response.data.game_id;

      if (id) {
        deferred.resolve({ game_id: id });
      } else {
        deferred.reject();
      }
    });

    return deferred.promise;
  };
});
