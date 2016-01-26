angular.module('collegiateRivals')

.directive 'touchdownButton', ($state) ->

  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        sc.score.setScores(6)
        $state.go('score.touchdown')
      )
  }