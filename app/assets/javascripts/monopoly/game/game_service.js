var app = angular.module("monopolyApp.game");

app.service('GameService', function($http, $q, $stateParams, PlayerService){
  var gameId = $stateParams.gameId;
  var game_state = null;

  function getStateFromServer(){
    return $http.get('/api/game/state', { params: {game_id: gameId }})
  }

  function assignPlayerToTile(player, idx){
    var tile = game_state.board.tiles[player.tile_number];

    if(tile.players){
      tile.players.push(player);
    } else {
      tile.players = [player];
    }
  }

  this.getState = function(){
    var deferred = $q.defer();

    getStateFromServer().then(function(response) {
      game_state = response.data.game;

      angular.forEach(game_state.players, assignPlayerToTile);

      deferred.resolve({ game_state: game_state });
    });

    return deferred.promise;
  }
});

