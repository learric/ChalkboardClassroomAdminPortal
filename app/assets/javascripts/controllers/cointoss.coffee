angular.module('collegiateRivals')

.controller 'CointossController', (SettingsFactory, GameplayFactory, TEAMS) ->
  cointoss = this

  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()
  cointoss.homeTeam = TEAMS.sec[home]
  cointoss.awayTeam = TEAMS.sec[away]

  cointoss.choice = (choice) ->
    toss = Math.floor(Math.random() * 2)

    if choice == 0
      cointoss.headsTails = 'heads'
    else
      cointoss.headsTails = 'tails'

    if choice == toss
      GameplayFactory.updateActiveTeam(1)
      cointoss.homeActive = false
      cointoss.awayActive = true
    else
      GameplayFactory.updateActiveTeam(0)
      cointoss.homeActive = true
      cointoss.awayActive = false

  return cointoss
