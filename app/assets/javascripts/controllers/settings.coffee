angular.module('controllers')

.controller 'SettingsController', (SettingsFactory, QuestionsFactory, TeachersFactory, $scope, $state, TEAMS, QUARTER_LENGTHS) ->

  settings = this

#
#  list teams
  settings.teams = TEAMS

#
#  list quarters
  settings.quarterLengths = QUARTER_LENGTHS.quarterLengths

#
#  save teams
  settings.saveTeam = (team) ->

#
#    check state before saving team
    state = $state.current.name

    if state == 'settings.homeTeam'
      SettingsFactory.saveHomeTeam(team)

    if state == 'settings.awayTeam'
      SettingsFactory.saveAwayTeam(team)

#
#  save quarter length
  settings.saveTime = (time) ->
    SettingsFactory.saveTime(time)

#
#  save questions
  settings.saveQuestions = (id) ->
    SettingsFactory.saveTeacher(id)
    QuestionsFactory.setTeacherId(id)
    QuestionsFactory.getQuestions(id)

#
#  save sound effect settings
  settings.saveSounds = (bool) ->
    SettingsFactory.saveSounds(bool)

  return settings
