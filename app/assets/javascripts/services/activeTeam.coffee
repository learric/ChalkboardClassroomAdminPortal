angular.module('services')

.factory 'ActiveTeamFactory', (SettingsFactory) ->

  activeTeam = 1

  return {
    setActiveTeam: (id) ->
      activeTeam = id

    toggleActiveTeam: ->
      if activeTeam == 0
        activeTeam = 1
      else
        activeTeam = 0

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
