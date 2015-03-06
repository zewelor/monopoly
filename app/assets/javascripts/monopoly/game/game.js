var app = angular.module("monopolyApp.game", []);

app.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider.state('game', {
    url: '/game/:gameId/:id',
    templateUrl: 'game.html',
    controller: 'GameController'
  });
});
