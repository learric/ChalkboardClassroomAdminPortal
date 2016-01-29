angular.module('controllers')

.controller 'CointossController', (SettingsFactory, ActiveTeamFactory, TEAMS) ->

  cointoss = this

  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()
  cointoss.homeTeam = TEAMS.sec[home]
  cointoss.awayTeam = TEAMS.sec[away]

  cointoss.coinflipChoiceLogo = cointoss.awayTeam.logo

  cointoss.choice = (choice) ->
    toss = Math.floor(Math.random() * 2)

    if choice == 0
      cointoss.headsTails = 'heads'
    else
      cointoss.headsTails = 'tails'

    if choice == toss
      ActiveTeamFactory.updateActiveTeam(1)
      cointoss.homeActive = false
      cointoss.awayActive = true
    else
      ActiveTeamFactory.updateActiveTeam(0)
      cointoss.homeActive = true
      cointoss.awayActive = false

  return cointoss
