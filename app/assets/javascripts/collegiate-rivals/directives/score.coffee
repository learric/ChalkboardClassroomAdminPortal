angular.module('collegiateRivals')

.directive 'touchdownButton', (ScoreFactory, ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'touchdown'
    link: (sc, el) ->
      el.addClass('btn btn-success animated rubberBand')
      el.on('click', ->
        active = ActiveTeamFactory.getActiveTeam()

        ScoreFactory.setScores(active, 6)
        $state.go('score.touchdown')
      )
  }

.directive 'onePointButton', (ScoreFactory, ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'one point'
    link: (sc, el) ->
      el.addClass('btn btn-primary left_button animated rubberBand')
      el.on('click', ->
        active = ActiveTeamFactory.getActiveTeam()
        random = Math.floor(Math.random() * 101)

        if random <= 98
          num = 1
          sc.score.scoreResult = 'good'
        else
          num = 0
          sc.score.scoreResult = 'no good'

        ScoreFactory.setScores(active, num)
        $state.go('score.result')
      )
  }

.directive 'twoPointButton', (ScoreFactory, ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'two points'
    link: (sc, el) ->
      el.addClass('btn btn-primary right_button animated rubberBand')
      el.on('click', ->
        active = ActiveTeamFactory.getActiveTeam()
        random = Math.floor(Math.random() * 101)

        if random <= 40
          num = 2
          sc.score.scoreResult = 'good'
        else
          num = 0
          sc.score.scoreResult = 'no good'

        ScoreFactory.setScores(active, num)
        $state.go('score.result')
      )
  }

.directive 'fgButton', (ScoreFactory, ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'field goal'
    link: (sc, el) ->
      el.addClass('btn btn-warning left_button animated rubberBand')
      el.on('click', ->
        active = ActiveTeamFactory.getActiveTeam()
        random = Math.floor(Math.random() * 101)

        if random <= 90
          num = 3
          sc.score.scoreResult = 'good'
        else
          num = 0
          sc.score.scoreResult = 'no good'

        ScoreFactory.setScores(active, num)
        $state.go('score.result')
      )
  }

.directive 'cancelScoreButton', (ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'Cancel'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()

      el.addClass('btn btn-danger right_button animated rubberBand')
      el.on('click', ->
        $state.go('play.new')
        clock.start()
      )
  }

.directive 'scoringKickoffButton', ($state, $timeout) ->
  return {
    restrict: 'EAC'
    template: 'next'
    link: (sc, el) ->
      el.hide()

      $timeout(->
        el.show()
      5000)

      el.addClass('btn btn-success right_button animated rubberBand')
      el.on('click', ->
        $state.go('gameplay.kickoff')
        buzz.all().stop()
      )
  }
