angular.module('collegiateRivals')

.directive 'winningTeamNickname', ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      if sc.outro.winnerId == null
        el.text('It\'s a tie!')
      else
        winnerName = sc.outro.winner.nickname
        winnerClass = sc.outro.winner.class

        el.addClass(winnerClass)
        el.text(winnerName + ' wins!')
  }

.directive 'winningTeamLogo', ->
  return {
    restrict: 'EAC'
    template: '<img class="animated tada" ng-src="/images/teams/{{ outro.winnerLogo }}.png" />'
    link: (sc, el) ->
      el.addClass('animated pulse infinite')
      id = sc.outro.winnerId

      if id == 1
        sc.outro.winnerLogo = 'away/' + sc.outro.winner.logo
      else
        sc.outro.winnerLogo = 'home/' + sc.outro.winner.logo
  }

.directive 'finalScore', ->
  return {
    restrict: 'EAC'
    template: 'Final score: {{ outro.final.home }} - {{ outro.final.away }}'
  }

.directive 'finalScoreButton', (SessionFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-success right_button animated rubberBand">Next</button>'
    link: (sc, el) ->
      result = sc.outro.winnerId

      el.on('click', ->
        if result != null
          SessionFactory.setWinsLosses(result)

        if result == 0
          $state.go('outro.reward')
        else
          $state.go('outro.social')
      )
  }

.directive 'rewardButton', (SessionFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-success right_button animated rubberBand">Next</button>'
    link: (sc, el) ->
      el.on('click', ->
        $state.go('outro.social')
      )
  }

.directive 'socialShareButton', (SessionFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-success right_button animated rubberBand">Next</button>'
    link: (sc, el) ->
      el.on('click', ->
        $state.go('outro.end')
      )
  }

.directive 'endGameButton', (SessionFactory, ScoreFactory, ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-success right_button animated rubberBand">Home</button>'
    link: (sc, el) ->
      el.on('click', ->
        ScoreFactory.resetScores()
        ClockFactory.resetQuarter()
        $state.go('home')
      )
  }
