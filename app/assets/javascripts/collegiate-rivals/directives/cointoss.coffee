angular.module('collegiateRivals')

.directive 'cointossChangeButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.addClass('btn btn-warning left_button animated rubberBand')
      el.on('click', ->
        $state.go('cointoss.choice')
      )
  }

.directive 'coinflipChoiceHeads', ($state, CointossFactory, SettingsFactory) ->
  return {
    restrict: 'EAC'
    template: '<div class="coin animated pulse infinite"><img ng-src="/images/teams/home/{{ cointoss.homeTeam }}.png" /></div>'
    link: (sc, el) ->
      team = SettingsFactory.getFullHomeTeam()

      sc.cointoss.homeTeam = team.logo

      el.on('click', ->
        CointossFactory.setCointoss(0)
        sc.cointoss.headsTails = 'heads'
        $state.go('cointoss.flip')
      )
  }

.directive 'coinflipChoiceTails', ($state, CointossFactory, SettingsFactory) ->
  return {
    restrict: 'EAC'
    template: '<div class="coin animated pulse infinite"><img ng-src="/images/teams/home/{{ cointoss.awayTeam }}.png" /></div>'
    link: (sc, el) ->
      team = SettingsFactory.getFullAwayTeam()

      sc.cointoss.awayTeam = team.logo

      el.on('click', ->
        CointossFactory.setCointoss(1)
        sc.cointoss.headsTails = 'tails'
        $state.go('cointoss.flip')
      )
  }

.directive 'coinflipChoiceConfirm', (CointossFactory, SettingsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<div class="coin larger_coin animated pulse infinite"><img ng-src="/images/teams/home/{{ cointoss' +
      '.tossChoice }}.png" /></div>'
    link: (sc, el) ->
      choice = CointossFactory.getCointossChoice()

      if choice == 0
        team = SettingsFactory.getFullHomeTeam()
        sc.cointoss.tossChoice = team.logo
      else
        team = SettingsFactory.getFullAwayTeam()
        sc.cointoss.tossChoice = team.logo

      el.on('click', ->
        $state.go('cointoss.result')
      )
  }

.directive 'coinflipFlipContainer', ($timeout) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.addClass('coin_flip_container animated slideInDown')

      $timeout(->
        el.hide()
      1600)
  }

.directive 'coinflipFlipCoin', (SettingsFactory, $timeout) ->
  return {
    restrict: 'EAC'
    template: '<section class="front"><div class="coin larger_coin"><img ng-src="/images/teams/home/{{ cointoss.homeTeamFlip }}.png" /></div></section><section class="back"><div class="coin larger_coin"><img ng-src="/images/teams/home/{{ cointoss.awayTeamFlip }}.png" /></div></section>'
    link: (sc, el) ->
      home = SettingsFactory.getFullHomeTeam()
      away = SettingsFactory.getFullAwayTeam()

      sc.cointoss.homeTeamFlip = home.logo
      sc.cointoss.awayTeamFlip = away.logo

      $timeout(->
        el.addClass('flip_coin')
      100)
  }

.directive 'coinflipResult', ($timeout, CointossFactory, SettingsFactory) ->
  return {
    restrict: 'EAC'
    template: '<img ng-src="/images/teams/home/{{ cointoss.tossResult }}.png" />'
    link: (sc, el) ->
      el.addClass('coin larger_coin animated infinite pulse')
      el.hide()
      winner = CointossFactory.getCointossWinner()
      result = CointossFactory.getCointossResult()

      if winner == 0
        team = SettingsFactory.getFullHomeTeam()
      else
        team = SettingsFactory.getFullAwayTeam()

      sc.cointoss.winner = team

      if result == 0
        teamResult = SettingsFactory.getFullHomeTeam()
        sc.cointoss.result = 'heads'
      else
        teamResult = SettingsFactory.getFullAwayTeam()
        sc.cointoss.result = 'tails'

      sc.cointoss.tossResult = teamResult.logo

      $timeout(->
        el.show()
      1600)
  }
