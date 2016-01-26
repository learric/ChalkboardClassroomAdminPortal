angular.module('controllers')

.controller 'ScoreController', (ActiveTeamFactory, ScoreFactory) ->

  score = this

  score.setScores = (num) ->
    active = ActiveTeamFactory.getActiveTeam()
    ScoreFactory.setScores(active, num)

  return score
