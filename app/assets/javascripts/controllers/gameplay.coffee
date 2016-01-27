angular.module('controllers')

.controller 'GameplayController', (ActiveTeamFactory, SettingsFactory, TEAMS) ->

  gameplay = this

  gameplay.teams = TEAMS

  activeTeam = ActiveTeamFactory.getActiveTeam()

  if activeTeam == 0
    gameplay.activeTeam = SettingsFactory.getHomeTeam()
  else
    gameplay.activeTeam = SettingsFactory.getAwayTeam()

  return gameplay
