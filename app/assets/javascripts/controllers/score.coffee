angular.module('controllers')

.controller 'ScoreController', (ActiveTeamFactory, ScoreFactory) ->

  score = this

  score.setScores = (num) ->
    random = Math.floor(Math.random() * 101)

    threeP = ->
      if random <= 90
        num = 3
      else
        num = 0

    twoP = ->
      if random <= 40
        num = 2
      else
        num = 0

    oneP = ->
      if random < 98
        num = 1
      else
        num = 0

    switch num
      when 3 then threeP()
      when 2 then twoP()
      when 1 then oneP()

    active = ActiveTeamFactory.getActiveTeam()
    ScoreFactory.setScores(active, num)

  return score
