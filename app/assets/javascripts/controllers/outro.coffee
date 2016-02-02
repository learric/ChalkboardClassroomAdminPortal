angular.module('controllers')

.controller 'OutroController', (SessionFactory, ScoreFactory, SettingsFactory) ->

  outro = this

  outro.final = ScoreFactory.getFinalScore()

  if outro.final.home > outro.final.away
    outro.winner = SettingsFactory.getFullHomeTeam()
    outro.winnerId = 0
  else if outro.final.home < outro.final.away
    outro.winner = SettingsFactory.getFullAwayTeam()
    outro.winnerId = 1
  else
    outro.winner = SettingsFactory.getFullHomeTeam()
    outro.winnerId = null

  return outro
