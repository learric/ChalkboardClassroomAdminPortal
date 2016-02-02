angular.module('collegiateRivals')

.directive 'homeButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        $state.go('home')
      )
  }

.directive 'settingsButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/homeTeam' then $state.go('settings.awayTeam')
          when '/awayTeam' then $state.go('settings.quarters')
          when '/quarters' then $state.go('settings.questions')
          when '/questions' then $state.go('settings.sounds')
          else $state.go('review')
      )
  }

.directive 'cointossButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button animated rubberBand')
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/flip' then $state.go('cointoss.result')
          else $state.go('gameplay.kickoff')
      )
  }

.directive 'startNewClock', (ClockFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        ClockFactory.setGameClock()
      )
  }

.directive 'kickoffButton', (ActiveTeamFactory, ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'kickoff'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()

      el.addClass('btn btn-success right_button')
      el.on('click', ->
        ActiveTeamFactory.toggleActiveTeam()
        clock.start()
        $state.go('gameplay.newplay')
      )
  }

.directive 'newQuestionButton', (ClockFactory, $state)->
  return {
    restrict: 'EAC'
    template: 'Huddle up'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()

      el.addClass('btn btn-success right_button')
      el.on('click', ->
        $state.go('question.ask')

        if !clock.running
          clock.start()
      )
  }

.directive 'newPlayButton', (PlaysService, $state) ->
  return {
    restrict: 'EAC'
    template: 'next'
    link: (sc, el) ->
      el.addClass('btn btn-success')
      el.on('click', ->
        PlaysService.setPlay()
        $state.go('play.new')
      )
  }
