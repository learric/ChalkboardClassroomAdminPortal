angular.module('collegiateRivals')

.directive 'homeButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        $state.go('home')
      )
  }