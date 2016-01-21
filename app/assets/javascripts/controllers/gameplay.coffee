angular.module('collegiateRivals')

.controller 'GameplayController', (GameplayFactory, SettingsFactory, TEAMS) ->

  gameplay = this

  activeTeam = GameplayFactory.getActiveTeam()

  if activeTeam == 0
    activeTeam = SettingsFactory.getHomeTeam()
  else
    activeTeam = SettingsFactory.getAwayTeam()

  gameplay.activeTeam = TEAMS.sec[activeTeam]

  return gameplay
