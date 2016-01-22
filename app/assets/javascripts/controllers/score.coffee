angular.module('collegiateRivals')

.controller 'ScoreController', (GameplayFactory, ScoreFactory) ->

  score = this

  score.setScores = (num) ->
    active = GameplayFactory.getActiveTeam()
    ScoreFactory.setScores(active, num)

  return score
