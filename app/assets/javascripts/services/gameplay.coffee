angular.module('services')

.factory 'GameplayFactory', ->

  activeTeam = 0

  return {
    updateActiveTeam: (id) ->
      activeTeam = id

    getActiveTeam: ->
      return activeTeam
  }
