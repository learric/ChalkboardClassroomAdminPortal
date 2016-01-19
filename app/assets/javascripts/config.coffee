angular.module('collegiateRivals', [
  'templates',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config(($stateProvider) ->

  $stateProvider
  .state('home',
    url: '/'
    templateUrl: 'index.html'
    controller: 'CoreController'
  )

  .state('menu',
    url: '/menu'
    templateUrl: 'menu.html'
  )

  .state('settings',
    url: '/settings'
    templateUrl: 'settings.html'
  )

  .state('cointoss',
    url: '/cointoss'
    templateUrl: 'cointoss.html'
  )

  .state('gameplay',
    url: '/gameplay'
    templateUrl: 'gameplay.html'
  )

  .state('question',
    url: '/question'
    templateUrl: 'question.html'
  )

  .state('play',
    url: '/play'
    templateUrl: 'play.html'
  )

  .state('score',
    url: '/score'
    templateUrl: 'score.html'
  )

  .state('interlude',
    url: '/interlude'
    templateUrl: 'interlude.html'
  )

  .state('outro',
    url: '/outro'
    templateUrl: 'outro.html'
  )
)
