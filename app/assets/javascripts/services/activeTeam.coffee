angular.module('services')

.factory 'ActiveTeamFactory', ->

  activeTeam = 0

  return {
    updateActiveTeam: (id) ->
      activeTeam = id

    getActiveTeam: ->
      return activeTeam
  }
