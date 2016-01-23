angular.module('collegiateRivals')

.directive 'touchdownButton', ($state) ->

  return {
    restrict: 'EAC'
    template: 'Touchdown'
    link: (sc, el) ->
      el.addClass('btn btn-primary')
      el.on('click', ->
        sc.score.setScores(6)
        $state.go('score.touchdown')
      )
  }