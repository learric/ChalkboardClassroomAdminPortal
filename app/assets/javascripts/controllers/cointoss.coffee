angular.module('collegiateRivals')

.controller 'CointossController', (SettingsFactory, TEAMS) ->
  cointoss = this

  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()
  cointoss.homeTeam = TEAMS.sec[home]
  cointoss.awayTeam = TEAMS.sec[away]

  return cointoss
