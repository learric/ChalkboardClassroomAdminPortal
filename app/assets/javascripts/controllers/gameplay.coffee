angular.module('controllers')

.controller 'GameplayController', (ActiveTeamFactory, SettingsFactory, TEAMS) ->

  gameplay = this

  activeTeam = ActiveTeamFactory.getActiveTeam()

  if activeTeam == 0
    activeTeam = SettingsFactory.getHomeTeam()
  else
    activeTeam = SettingsFactory.getAwayTeam()

  gameplay.activeTeam = TEAMS.sec[activeTeam]

  return gameplay
