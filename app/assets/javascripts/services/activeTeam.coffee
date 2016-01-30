angular.module('services')

.factory 'ActiveTeamFactory', (SettingsFactory) ->

  activeTeam = 0

  return {
    setActiveTeam: (id) ->
      activeTeam = id

    getActiveTeam: ->
      return activeTeam

    getFullActiveTeam: ->
      if activeTeam == 0
        team = SettingsFactory.getFullHomeTeam()
      else
        team = SettingsFactory.getFullAwayTeam()

      return team

    getFullInactiveTeam: ->
      if activeTeam == 1
        team = SettingsFactory.getFullHomeTeam()
      else
        team = SettingsFactory.getFullAwayTeam()

      return team
  }
