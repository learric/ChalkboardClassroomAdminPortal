angular.module('collegiateRivals')

.directive 'playAction', (PlaysService) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      play = PlaysService.getPlay()
      el.text(play.action)
  }

.directive 'playResult', (PlaysService) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      play = PlaysService.getPlay()
      el.text(play.result)
  }

.directive 'scoreButton', (ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'score'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()

      el.addClass('btn btn-primary left_button')
      el.on('click', ->
        clock.stop()
        $state.go('score.confirm')
      )
  }

.directive 'nextPlayButton', (ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'next'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button')
      el.on('click', ->
        $state.go('gameplay.newplay')
        ActiveTeamFactory.toggleActiveTeam()
      )
  }
