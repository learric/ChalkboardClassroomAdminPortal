angular.module('collegiateRivals')

.directive 'clockFace', (ClockFactory, $timeout, $state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()
      time = clock.getTime()
      quarter = ClockFactory.getQuarter()

      checkTime = ->
        minTen = clock.face.lists[2].digit
        minOne = clock.face.lists[3].digit
        secTen = clock.face.lists[4].digit
        secOne = clock.face.lists[5].digit

        if minTen == '0'
          el.text(minOne + ':' + secTen + secOne)
        else
          el.text(minTen + minOne + ':' + secTen + secOne)

        $timeout(->
          if (minTen == '0' && minOne == '0' && secTen == '0' && secOne == '0')
            switch quarter
              when 1 then $state.go('interlude.first')
              when 2 then $state.go('interlude.half')
              when 3 then $state.go('interlude.third')
              else $state.go('interlude.end')

          else
            checkTime()
          1000)

      checkTime()
  }

.directive 'quarterTracker', (ClockFactory) ->
  return {
    restrict: 'EAC'
    template: '{{ scoreboard.quarter }}'
    link: (sc, el) ->
      sc.scoreboard.quarter = ClockFactory.getQuarter()
  }

.directive 'clockControls', (ClockFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      clock = ClockFactory.getGameClock()

      if clock.running
        el.addClass('fa fa-pause')
      else
        el.addClass('fa fa-play')

      el.on('click', ->
        if clock.running
          clock.stop()
          el.addClass('fa-play')
          el.removeClass('fa-pause')
        else
          clock.start()
          el.addClass('fa-pause')
          el.removeClass('fa-play')
      )
  }

.directive 'soundControls', (SettingsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      sounds = SettingsFactory.getSounds()

      if sounds
        el.addClass('fa fa-volume-up')
      else
        el.addClass('fa fa-volume-off')

      el.on('click', ->
        sounds = SettingsFactory.getSounds()

        if sounds
          SettingsFactory.saveSounds(false)
          el.addClass('fa-volume-off')
          el.removeClass('fa-volume-up')
        else
          SettingsFactory.saveSounds(true)
          el.addClass('fa-volume-up')
          el.removeClass('fa-volume-off')
      )
  }

.directive 'homeControls', (ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = $state.current.name
        clock = ClockFactory.getGameClock()

        ClockFactory.setState(state)
        $state.go('paused')
        clock.stop()
      )
  }

.directive 'previousStateButton', (ClockFactory, $state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = ClockFactory.getState()
        clock = ClockFactory.getGameClock()

        $state.go(state)
        clock.start()
      )
  }
