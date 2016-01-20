angular.module('collegiateRivals', [
  'templates',
  'services',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config(($stateProvider) ->

  $stateProvider

#
#  home states
  .state('home',
    url: '/'
    templateUrl: 'index.html'
  )

#
#  menu states
  .state('menu',
    url: '/menu'
    templateUrl: 'menu.html'
  )

#
#  settings states
  .state('settings',
    url: '/settings'
    templateUrl: 'settings.html'
    controller: 'SettingsController as settings'
  )

  .state('settings.homeTeam',
    url: '/homeTeam'
    views: {
      'header': {
        template: '<h2>Home Team</h2>'
      }
      'list': {
        template: '<ul><team-choices></team-choices></ul>'
      }
    }
  )

  .state('settings.awayTeam',
    url: '/awayTeam'
    views: {
      'header': {
        template: '<h2>Away Team</h2>'
      }
      'list': {
        template: '<ul><team-choices></team-choices></ul>'
      }
    }
  )

  .state('settings.quarters',
    url: '/quarters'
    views: {
      'header': {
        template: '<h2>Quarters</h2>'
      }
      'list': {
        template: '<ul><quarter-choices></quarter-choices></ul>'
      }
    }
  )

  .state('settings.questions',
    url: '/questions'
    views: {
      'header': {
        template: '<h2>Questions</h2>'
      }
    }
  )

  .state('settings.sounds',
    url: '/sounds'
    views: {
      'header': {
        template: '<h2>Sounds</h2>'
      }
      'list': {
        template: '<ul><sound-choices></sound-choices></ul>'
      }
    }
  )

#
#  review settings state
  .state('review',
    url: '/review'
    templateUrl: 'review.html'
    controller: 'ReviewController as review'
  )

#
#  cointoss states
  .state('cointoss',
    url: '/cointoss'
    templateUrl: 'cointoss.html'
  )

#
#  gameplay states
  .state('gameplay',
    url: '/gameplay'
    templateUrl: 'gameplay.html'
  )

#
#  question states
  .state('question',
    url: '/question'
    templateUrl: 'question.html'
  )

#
#  play states
  .state('play',
    url: '/play'
    templateUrl: 'play.html'
  )

#
#  score states
  .state('score',
    url: '/score'
    templateUrl: 'score.html'
  )

#
#  interlude states
  .state('interlude',
    url: '/interlude'
    templateUrl: 'interlude.html'
  )

#
#  outro states
  .state('outro',
    url: '/outro'
    templateUrl: 'outro.html'
  )
)
