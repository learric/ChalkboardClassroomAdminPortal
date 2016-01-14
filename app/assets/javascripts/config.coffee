angular.module('collegiateRivals', [
  'templates',
  'ngRoute',
  'ngCookies'
])

.config([ '$routeProvider', ($routeProvider) ->
  $routeProvider
  .when('/',
    templateUrl: "index.html"
    controller: "CoreController"
  )

  .when('/home',
    templateUrl: "home.html"
  )
])
