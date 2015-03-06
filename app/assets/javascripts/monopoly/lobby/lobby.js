var app = angular.module("monopolyApp.lobby", []);

app.config(function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/lobby');

  $stateProvider.state('lobby', {
    url: '/lobby',
    templateUrl: 'lobby.html',
    controller: 'LobbyController'
  });
});
