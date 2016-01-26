angular.module('collegiateRivals')

.directive 'cointossButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/choice' then $state.go('cointoss.flip')
          when '/flip' then $state.go('cointoss.result')
          else $state.go('gameplay.kickoff')
      )
  }

.directive 'coinflipButtons', ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-primary" cointoss-button ng-click="cointoss.choice(0)">Heads</button> <button class="btn btn-primary" cointoss-button ng-click="cointoss.choice(1)">Tails</button>'
  }