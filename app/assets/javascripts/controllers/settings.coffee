angular.module('collegiateRivals')

.controller 'SettingsController', (SettingsFactory, QuestionsFactory, $scope, $state, TEAMS, QUARTER_LENGTHS) ->

  settings = this

#
#  list teams
  settings.teams = TEAMS.sec

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
    SettingsFactory.saveQuestions(id)
    QuestionsFactory.setTeacherId(id)
    $scope.getQuestions()

#
#  save sound effect settings
  settings.saveSounds = (bool) ->
    SettingsFactory.saveSounds(bool)

  return settings
