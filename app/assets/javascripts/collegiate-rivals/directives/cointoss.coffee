angular.module('collegiateRivals')

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

.directive 'coinflipChoiceHeads', ($state, CointossFactory, SettingsFactory, TEAMS) ->
  return {
    restrict: 'EAC'
    template: '<div class="coin"><img ng-src="/assets/teams/home/{{ cointoss.homeTeam }}.png" /></div>'
    link: (sc, el) ->
      id = SettingsFactory.getHomeTeam()
      team = TEAMS.sec[id].logo

      sc.cointoss.homeTeam = team

      el.addClass('animated pulse infinite')
      el.on('click', ->
        CointossFactory.setCointoss(0)
        sc.cointoss.headsTails = 'heads'
        $state.go('cointoss.flip')
      )
  }

.directive 'coinflipChoiceTails', ($state, CointossFactory, SettingsFactory, TEAMS) ->
  return {
    restrict: 'EAC'
    template: '<div class="coin"><img ng-src="/assets/teams/away/{{ cointoss.awayTeam }}.png" /></div>'
    link: (sc, el) ->
      id = SettingsFactory.getAwayTeam()
      team = TEAMS.sec[id].logo

      sc.cointoss.awayTeam = team

      el.addClass('animated pulse infinite')
      el.on('click', ->
        CointossFactory.setCointoss(1)
        sc.cointoss.headsTails = 'tails'
        $state.go('cointoss.flip')
      )
  }
