angular.module('services')

.factory 'ScoreFactory', ->

  home = 0
  away = 0

  return {
    getHomeScore: ->
      return home

    getAwayScore: ->
      return away

    setScores: (team, num) ->
      if team == 0
        home += num
      else
        away += num
  }