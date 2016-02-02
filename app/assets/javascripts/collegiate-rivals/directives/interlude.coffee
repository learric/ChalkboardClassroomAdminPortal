angular.module('collegiateRivals')

.directive 'interludeButton', (ClockFactory, $timeout, $state) ->
  return {
    restrict: 'EAC'
    template: 'next'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button')
      el.hide()

      $timeout(->
        el.show()
      15100)

      el.on('click', ->
        $state.go('gameplay.newplay')
        ClockFactory.setQuarter()
        ClockFactory.setGameClock()
      )
  }

.directive 'skipVideoCounter', ($timeout) ->
  return {
    restrict: 'EAC'
    template: 'you can skip this video in {{ interlude.skipSeconds }}'
    link: (sc, el) ->
      el.addClass('left_button')
      el.show()

      sc.interlude.skipSeconds = 15

      incSecs = ->
        $timeout(->
          if sc.interlude.skipSeconds > 1
            sc.interlude.skipSeconds -= 1
            incSecs()
          else
            el.hide()
        1000)

      incSecs()
  }

.directive 'outroButton', ($timeout, $state) ->
  return {
    restrict: 'EAC'
    template: 'next'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button')
      el.hide()

      $timeout(->
        el.show()
      15100)

      el.on('click', ->
        $state.go('outro.final')
      )
  }
