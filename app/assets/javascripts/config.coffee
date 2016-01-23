angular.module('collegiateRivals', [
  'templates',
  'services',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config(($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/')

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
      'list': {
        template: '<question-choices></question-choices>'
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
    controller: 'CointossController as cointoss'
  )

  .state('cointoss.choice',
    url: '/choice'
    views: {
      'header': {
        template: '<h2>Choice</h2>'
      }
      'buttons': {
        template: '<coinflip-buttons></coinflip-buttons>'
      }
    }
  )

  .state('cointoss.flip',
    url: '/flip'
    views: {
      'header': {
        template: '<h2>Flip</h2>'
      }
      'subheader': {
        template: '<p>chooses {{ cointoss.headsTails }}</p>'
      }
      'buttons': {
        template: '<button class="btn btn-primary" cointoss-button>Flip</button>'
      }
    }
  )

  .state('cointoss.result',
    url: '/result'
    views: {
      'header': {
        template: '<h2>Result</h2>'
      }
      'subheader': {
        template: '<span ng-show="cointoss.homeActive">{{ cointoss.homeTeam.nickname }}</span><span ng-show="cointoss.awayActive">{{ cointoss.awayTeam.nickname }}</span>'
      }
      'buttons': {
        template: '<button class="btn btn-primary" cointoss-button>Start</button>'
      }
    }
  )

#
#  gameplay states
  .state('gameplay',
    url: '/gameplay'
    templateUrl: 'gameplay.html'
    controller: 'GameplayController as gameplay'
  )

  .state('gameplay.kickoff',
    url: '/kickoff'
    views: {
      'scoreboard': {
        template: 'Scoreboard'
      }
      'header': {
        template: 'Kickoff'
      }
      'buttons': {
        template: '<button class="btn btn-primary" ui-sref="gameplay.newplay">Kick</button>'
      }
    }
  )

  .state('gameplay.newplay',
    url: '/newplay'
    views: {
      'scoreboard': {
        template: 'Scoreboard'
      }
      'header': {
        template: 'New Play'
      }
      'buttons': {
        template: '<button class="btn btn-primary" ui-sref="question.ask">New</button>'
      }
    }
  )

#
#  question states
  .state('question',
    url: '/question'
    templateUrl: 'question.html'
    controller: 'QuestionController as question'
  )

  .state('question.ask',
    url: '/ask'
    views: {
      'header': {
        template: '<h2>Ask Question</h2>'
      }
    }
  )

#
#  play states
  .state('play',
    url: '/play'
    templateUrl: 'play.html'
    controller: 'PlaysController as plays'
  )

#
#  score states
  .state('score',
    url: '/score'
    templateUrl: 'score.html'
    controller: 'ScoreController as score'
  )

  .state('score.confirm',
    url: '/confirm'
    views: {
      'header': {
        template: '<h2>Confirm</h2>'
      }
      'buttons': {
        template: '<touchdown-button></touchdown-button> <a class="btn btn-primary" ui-sref="score.three" ng-click="score.setScores(3)">Field Goal</a> <a class="btn btn-primary" ui-sref="play">Back</a>'
      }
    }
  )

  .state('score.touchdown',
    url: '/touchdown'
    views: {
      'header': {
        template: '<h2>Touchdown</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.one" ng-click="score.setScores(1)">One Point</a> <a class="btn btn-primary" ui-sref="score.two" ng-click="score.setScores(2)">Two Point</a>'
      }
    }
  )

  .state('score.one',
    url: '/one'
    views: {
      'header': {
        template: '<h2>One Point</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.two',
    url: '/two'
    views: {
      'header': {
        template: '<h2>Two Points</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.three',
    url: '/three'
    views: {
      'header': {
        template: '<h2>Field Goal</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.kickoff',
    url: '/kickoff'
    views: {
      'header': {
        template: '<h2>Kickoff</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="gameplay.newplay">Kick</a>'
      }
    }
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
