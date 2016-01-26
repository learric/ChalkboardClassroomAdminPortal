angular.module('controllers')

.controller 'ReviewController', (SettingsFactory, TeachersFactory, $scope, TEAMS) ->

  review = this

#
#  get settings
  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()
  questionId = SettingsFactory.getTeacher()
  teacher = TeachersFactory.singleTeacher(questionId)
  sounds = SettingsFactory.getSounds()

#
#  list settings
  review.homeTeam = TEAMS.sec[home]
  review.awayTeam = TEAMS.sec[away]
  review.quarterLength = SettingsFactory.getTime()

  if teacher == 0
    review.questions = 'Default Questions'
  else
    review.questions = teacher[0].classroom_name + ' Questions'

  if sounds == true
    review.sounds = 'On'
  else
    review.sounds = 'Off'

  return review
