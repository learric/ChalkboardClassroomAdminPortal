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
        template: '<h2 active-team-nickname></h2>'
      }
      'category': {
        template: '<h3>{{ question.questionList.category }} Question</h3>'
      }
      'firstLine': {
        template: '<p>{{ question.questionList.firstLine }}</p>'
      }
      'buttons': {
        template: '<first-answer></first-answer><second-answer></second-answer><third-answer></third-answer><fourth-answer></fourth-answer>'
      }
    }
  )

  .state('question.incorrect',
    url: '/incorrect'
    views: {
      'header': {
        template: '<h2 active-team-nickname></h2>'
      }
      'category': {
        template: '<h3>incorrect!</h3>'
      }
      'firstLine': {
        template: '<div class="answer_icon animated tada"><span class="fa fa-close text-danger animated pulse infinite"></span></div>'
      }
      'lastLine': {
        template: '<p>The correct answer is<br />{{ question.questionList.answers[3] }}</p>'
      }
      'buttons': {
        template: '<incorrect-button></incorrect-button>'
      }
    }
  )

  .state('question.correct',
    url: '/correct'
    views: {
      'header': {
        template: '<h2 active-team-nickname></h2>'
      }
      'category': {
        template: '<h3>That\'s correct!</h3>'
      }
      'firstLine': {
        template: '<div class="answer_icon animated tada"><span class="fa fa-check text-success animated pulse infinite"></span></div>'
      }
      'lastLine': {
        template: '<p class="animated tada infinite" active-team-slogan></p>'
      }
      'buttons': {
        template: '<correct-button></correct-button>'
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
        template: '<h2 active-team-nickname></h2>'
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
    controller: 'InterludeController as interlude'
  )

  .state('interlude.first',
    url: '/first'
    views: {
      'header': {
        template: '<h2>End of the First quarter!</h2>'
      }
      'subheader': {
        template: ''
      }
      'video': {
        template: '<iframe src="https://www.youtube.com/embed/EDlC7oG_2W4" frameborder="0" allowfullscreen></iframe>'
      }
      'buttons': {
        template: '<skip-video-counter></skip-video-counter><interlude-button></interlude-button>'
      }
    }
  )

  .state('interlude.half',
    url: '/half'
    views: {
      'header': {
        template: '<h2>Halftime!</h2>'
      }
      'subheader': {
        template: ''
      }
      'video': {
        template: '<iframe src="https://www.youtube.com/embed/Tja6_h4lT6A" frameborder="0" allowfullscreen></iframe>'
      }
      'buttons': {
        template: '<skip-video-counter></skip-video-counter><interlude-button></interlude-button>'
      }
    }
  )

  .state('interlude.third',
    url: '/third'
    views: {
      'header': {
        template: '<h2>End of the Third Quarter</h2>'
      }
      'subheader': {
        template: ''
      }
      'video': {
        template: '<iframe src="https://www.youtube.com/embed/R2F_hGwD26g" frameborder="0" allowfullscreen></iframe>'
      }
      'buttons': {
        template: '<skip-video-counter></skip-video-counter><interlude-button></interlude-button>'
      }
    }
  )

  .state('interlude.end',
    url: '/end'
    views: {
      'header': {
        template: '<h2>End of the game!</h2>'
      }
      'subheader': {
        template: ''
      }
      'video': {
        template: '<iframe src="https://www.youtube.com/embed/fj-10lIrboM" frameborder="0" allowfullscreen></iframe>'
      }
      'buttons': {
        template: '<skip-video-counter></skip-video-counter><outro-button></outro-button>'
      }
    }
  )

#
#  outro states
  .state('outro',
    url: '/outro'
    templateUrl: 'collegiate-rivals/outro.html'
    controller: 'OutroController as outro'
  )

  .state('outro.final',
    url: '/final'
    views: {
      'header': {
        template: '<h2>Game Over!</h2>'
      }
      'subheader': {
        template: '<h3 winning-team-nickname></h3>'
      }
      'content': {
        template: '<h3 final-score></h3>'
      }
      'logo': {
        template: '<div winning-team-logo></div>'
      }
      'buttons': {
        template: '<final-score-button></final-score-button>'
      }
    }
  )

  .state('outro.reward',
    url: '/reward'
    views: {
      'header': {
        template: '<h2 home-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>Check your email!</h3>'
      }
      'content': {
        template: '<p>You have a reward waiting for winning!</p>'
      }
      'logo': {
        template: '<div winning-team-logo></div>'
      }
      'buttons': {
        template: '<reward-button></reward-button>'
      }
    }
  )

  .state('outro.social',
    url: '/social'
    views: {
      'header': {
        template: '<h2 home-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>Share your score on Facebook!</h3>'
      }
      'content': {
        template: '<p>(coming soon)</p>'
      }
      'logo': {
        template: '<div winning-team-logo></div>'
      }
      'buttons': {
        template: '<social-share-button></social-share-button>'
      }
    }
  )

  .state('outro.end',
    url: '/end'
    views: {
      'header': {
        template: '<h2 home-team-nickname></h2>'
      }
      'subheader': {
        template: '<h3>End of game</h3>'
      }
      'content': {
        template: '<p>Click below to start over</p>'
      }
      'logo': {
        template: '<div winning-team-logo></div>'
      }
      'buttons': {
        template: '<end-game-button></end-game-button>'
      }
    }
  )
)
