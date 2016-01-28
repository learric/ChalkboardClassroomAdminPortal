angular.module('collegiateRivals', [
  'templates',
  'services',
  'controllers',
  'constants',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config(($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/')

  $stateProvider

#
#  home state
  .state('home',
    url: '/'
    templateUrl: 'collegiate-rivals/index.html'
  )

#
#  menu state
  .state('menu',
    url: '/menu'
    templateUrl: 'collegiate-rivals/menu.html'
  )

#
#  settings states
  .state('settings',
    url: '/settings'
    templateUrl: 'collegiate-rivals/settings.html'
    controller: 'SettingsController as settings'
  )

  .state('settings.homeTeam',
    url: '/homeTeam'
    views: {
      'header': {
        template: '<h2>Choose Home Team</h2>'
      }
      'list': {
        template: '<home-team-choices></home-team-choices>'
      }
    }
  )

  .state('settings.awayTeam',
    url: '/awayTeam'
    views: {
      'header': {
        template: '<h2>Choose Away Team</h2>'
      }
      'list': {
        template: '<away-team-choices></away-team-choices>'
      }
    }
  )

  .state('settings.quarters',
    url: '/quarters'
    views: {
      'header': {
        template: '<h2>Choose Quarter Length</h2>'
      }
      'list': {
        template: '<quarter-choices></quarter-choices>'
      }
    }
  )

  .state('settings.questions',
    url: '/questions'
    views: {
      'header': {
        template: '<h2>Choose Question List</h2>'
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
        template: '<sound-choices></sound-choices>'
      }
    }
  )

#
#  review settings state
  .state('review',
    url: '/review'
    templateUrl: 'collegiate-rivals/review.html'
    controller: 'ReviewController as review'
  )

#
#  cointoss states
  .state('cointoss',
    url: '/cointoss'
    templateUrl: 'collegiate-rivals/cointoss.html'
    controller: 'CointossController as cointoss'
  )

  .state('cointoss.choice',
    url: '/choice'
    views: {
      'header': {
        template: '<h2>{{ cointoss.awayTeam.nickname }}</h2>'
      }
      'subheader': {
        template: '<h3>Choose Heads or Tails</h3>'
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
        template: '<h2>{{ cointoss.awayTeam.nickname }}</h2>'
      }
      'subheader': {
        template: '<h3>chooses {{cointoss.headsTails}}</h3>'
      }
      'buttons': {
        template: '<cointoss-button>Flip</cointoss-button>'
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
        template: '<span ng-show="cointoss.homeActive">{{cointoss.homeTeam.nickname}}</span><span ng-show="cointoss.awayActive">{{cointoss.awayTeam.nickname}}</span>'
      }
      'buttons': {
        template: '<cointoss-button>Start</cointoss-button>'
      }
    }
  )

#
#  gameplay states
  .state('gameplay',
    url: '/gameplay'
    templateUrl: 'collegiate-rivals/gameplay.html'
    controller: 'GameplayController as gameplay'
  )

  .state('gameplay.kickoff',
    url: '/kickoff'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>{{ gameplay.teams.sec[gameplay.activeTeam].nickname }}</h2>'
      }
      'subheader': {
        template: '<h3>Line up to kickoff</h3>'
      }
      'buttons': {
        template: '<button class="btn btn-success right_button" ui-sref="gameplay.newplay">Kickoff</button>'
      }
    }
  )

  .state('gameplay.newplay',
    url: '/newplay'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>{{ gameplay.teams.sec[gameplay.activeTeam].nickname }}</h2>'
      }
      'subheader': {
        template: '<h3>Call a new play</h3>'
      }
      'buttons': {
        template: '<button class="btn btn-success right_button" ui-sref="question.ask">New</button>'
      }
    }
  )

#
#  question states
  .state('question',
    url: '/question'
    templateUrl: 'collegiate-rivals/question.html'
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
    templateUrl: 'collegiate-rivals/play.html'
    controller: 'PlaysController as plays'
  )

  .state('play.new',
    url: '/new'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
    }
  )

#
#  score states
  .state('score',
    url: '/score'
    templateUrl: 'collegiate-rivals/score.html'
    controller: 'ScoreController as score'
  )

  .state('score.confirm',
    url: '/confirm'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>Active Team</h2>'
      }
      'subheader': {
        template: '<h3>Confirm?</h3>'
      }
      'buttons': {
        template: '<a class="btn btn-warning left_button" ui-sref="score.three" ng-click="score.setScores(3)">Field Goal</a> <a class="btn btn-success" touchdown-button>Touchdown</a> <a class="btn btn-danger right_button" ui-sref="play.new">Back</a>'
      }
    }
  )

  .state('score.touchdown',
    url: '/touchdown'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>Touchdown</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary left_button" ui-sref="score.one" ng-click="score.setScores(1)">One Point</a> <a class="btn btn-primary right_button" ui-sref="score.two" ng-click="score.setScores(2)">Two Point</a>'
      }
    }
  )

  .state('score.one',
    url: '/one'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>One Point</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-success right_button" ui-sref="gameplay.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.two',
    url: '/two'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>Two Points</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-success right_button" ui-sref="gameplay.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.three',
    url: '/three'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2>Field Goal</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-success right_button" ui-sref="gameplay.kickoff">Kickoff</a>'
      }
    }
  )

#
#  interlude states
  .state('interlude',
    url: '/interlude'
    templateUrl: 'collegiate-rivals/interlude.html'
  )

#
#  outro states
  .state('outro',
    url: '/outro'
    templateUrl: 'collegiate-rivals/outro.html'
  )
)
