angular.module('collegiateRivals', [
  'templates',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config([ '$stateProvider', ($stateProvider) ->
  $stateProvider
  .state('/',
    url: '/'
    templateUrl: 'index.html'
    controller: 'CoreController'
  )
])
