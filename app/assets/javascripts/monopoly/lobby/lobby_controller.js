var app = angular.module("monopolyApp.lobby");

app.controller('LobbyController', function($scope, $interval, $state, LobbyService) {
  var timer = $interval(findGame, 3000);

  function findGame() {
    LobbyService.findGame().then(function(response) {
      $state.go('game', { gameId: response.game_id} );
      $interval.cancel(timer);
    })
  }

  $scope.$on('$destroy', function() {
    $interval.cancel(timer);
  });
});


