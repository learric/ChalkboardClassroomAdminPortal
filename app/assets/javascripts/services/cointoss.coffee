angular.module('services')

.factory 'CointossFactory', (ActiveTeamFactory) ->

  tossChoice = tossResult = tossWinner = 0

  return {
    setCointoss: (choice) ->
      tossChoice = choice
      tossResult = Math.floor(Math.random() * 2)

      if tossChoice == tossResult
        ActiveTeamFactory.setActiveTeam(1)
        tossWinner = 1
      else
        ActiveTeamFactory.setActiveTeam(0)
        tossWinner = 0

    getCointossResult: ->
      return tossResult

    getCointossWinner: ->
      return tossWinner
  }