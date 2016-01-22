angular.module('collegiateRivals')

.controller 'SettingsController', (SettingsFactory, QuestionsFactory, TeachersFactory, $scope, $state, TEAMS, QUARTER_LENGTHS) ->

  settings = this

#
#  list teams
  settings.teams = TEAMS.sec

#
#  list quarters
  settings.quarterLengths = QUARTER_LENGTHS.quarterLengths

#
#  list teachers
  settings.listTeachers = TeachersFactory.getTeachers()

  if Object.keys(settings.listTeachers).length == 0
    TeachersFactory.setTeachers().then((res) ->
      settings.listTeachers = res
    )

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
    $scope.getQuestions()

#
#  save sound effect settings
  settings.saveSounds = (bool) ->
    SettingsFactory.saveSounds(bool)

  return settings
