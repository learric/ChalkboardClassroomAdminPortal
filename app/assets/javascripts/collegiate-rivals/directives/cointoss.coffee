angular.module('collegiateRivals')

.directive 'cointossButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button')
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/flip' then $state.go('cointoss.result')
          else $state.go('gameplay.kickoff')
      )
  }

.directive 'coinflipButtons', ($state) ->
  return {
    restrict: 'EAC'
    template: '<button class="btn btn-primary left_button" ng-click="cointoss.choice(0)">Heads</button> <button class="btn btn-primary right_button" ng-click="cointoss.choice(1)">Tails</button>'
    link: (sc, el) ->
      el.on('click', ->
        $state.go('cointoss.flip')
      )
  }