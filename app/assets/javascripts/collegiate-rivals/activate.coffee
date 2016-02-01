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
#  paused state
  .state('paused',
    url: '/paused'
    templateUrl: 'collegiate-rivals/paused.html'
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
        template: '<h2 away-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>Choose Heads or Tails!</h3>'
      }
      'coinAnimation': {
        template: '<div coinflip-choice-heads></div><div coinflip-choice-tails></div>'
      }
    }
  )

  .state('cointoss.flip',
    url: '/flip'
    views: {
      'header': {
        template: '<h2 away-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>chooses {{ cointoss.headsTails }}</h3>'
      }
      'coinAnimation': {
        template: '<div coinflip-choice-confirm></div>'
      }
      'buttons': {
        template: '<cointoss-change-button>Change</cointoss-change-button><cointoss-button>Flip Coin</cointoss-button>'
      }
    }
  )

  .state('cointoss.result',
    url: '/result'
    views: {
      'header': {
        template: '<h2 class="{{ cointoss.winner.class }}">{{ cointoss.winner.nickname }}</h2>'
      }
      'subheader': {
        template: '<h3>It\'s {{ cointoss.result }}, you win!</h3>'
      }
      'coinAnimation': {
        template: '<div coinflip-flip-container><div id="coin" coinflip-flip-coin></div></div><section><div coinflip-result></div></section>'
      }
      'buttons': {
        template: '<cointoss-button>Kickoff</cointoss-button>'
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
        template: '<h2 active-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>line up to kick off</h3>'
      }
      'buttons': {
        template: '<kickoff-button></kickoff-button>'
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
        template: '<h2 active-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>Call a new play</h3>'
      }
      'buttons': {
        template: '<new-question-button></new-question-button>'
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
        template: '<h2 active-team-nickname>Ask Question</h2>'
      }
      'buttons': {
        template: '<new-play-button></new-play-button>'
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
      'header': {
        template: '<h2 active-team-nickname></h2>'
      }
      'action': {
        template: '<h3 play-action></h3>'
      }
      'result': {
        template: '<h3 play-result></h3>'
      }
      'score': {
        template: '<score-button></score-button>'
      }
      'next': {
        template: '<next-play-button></next-play-button>'
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
        template: '<h2 active-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>Did you score?</h3>'
      }
      'buttons': {
        template: '<fg-button></fg-button><touchdown-button></touchdown-button><cancel-score-button></cancel-score-button>'
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
        template: '<h2 active-team-nickname>Touchdown</h2>'
      }
      'subheader': {
        template: '<h3>Choose an extra point try!</h3>'
      }
      'buttons': {
        template: '<one-point-button></one-point-button><two-point-button></two-point-button>'
      }
    }
  )

  .state('score.result',
    url: '/result'
    views: {
      'scoreboard': {
        templateUrl: 'collegiate-rivals/scoreboard.html'
      }
      'header': {
        template: '<h2 active-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>It\'s {{ score.scoreResult }}!</h3>'
      }
      'buttons': {
        template: '<scoring-kickoff-button></scoring-kickoff-button>'
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
