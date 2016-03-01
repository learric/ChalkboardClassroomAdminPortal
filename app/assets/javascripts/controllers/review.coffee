angular.module('controllers')

.controller 'ReviewController', (SettingsFactory, QuestionsFactory, $scope, TEAMS) ->

  review = this

#
#  get settings
  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()
  questionId = SettingsFactory.getTeacher()
  sounds = SettingsFactory.getSounds()

#
#  list settings
  review.homeTeam = TEAMS.sec[home]
  review.awayTeam = TEAMS.sec[away]
  review.questions = questionId
  review.quarterLength = SettingsFactory.getTime()

  if sounds == true
    review.sounds = 'On'
  else
    review.sounds = 'Off'

  return review
