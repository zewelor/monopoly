var app = angular.module("monopolyApp.game");

app.controller('GameController', function($scope, $interval, PlayerService, GameService){
  PlayerService.getId().then(function(response) {
    $scope.playerId = response.id
  });

  getGameState();

  var timer = $interval(getGameState, 3000);

  function getGameState(){
    GameService.getState().then(function(response) {
      $scope.game = response.game_state;
    })
  }

  $scope.$on('$destroy', function() {
    $interval.cancel(timer);
  });
});

