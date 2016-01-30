angular.module('services')

.factory 'ActiveTeamFactory', ->

  activeTeam = 0

  return {
    setActiveTeam: (id) ->
      activeTeam = id

    getActiveTeam: ->
      return activeTeam
  }
