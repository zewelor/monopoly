var app = angular.module("monopolyApp", [
  'ui.router',
  'templates',
  'angularSpinner',
  'monopolyApp.player',
  'monopolyApp.lobby',
  'monopolyApp.game'
]);

app.config(['usSpinnerConfigProvider', function (usSpinnerConfigProvider) {
  usSpinnerConfigProvider.setDefaults({radius:30, width:8, length: 16});
}]);

