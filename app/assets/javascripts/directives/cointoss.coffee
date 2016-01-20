angular.module('collegiateRivals')

.directive 'cointossButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/welcome' then $state.go('cointoss.choice')
          when '/choice' then $state.go('cointoss.flip')
          when '/flip' then $state.go('cointoss.result')
          else $state.go('gameplay')
      )
  }