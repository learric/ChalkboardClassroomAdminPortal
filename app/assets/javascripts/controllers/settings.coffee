angular.module('collegiateRivals')

.controller 'SettingsController', ($scope, $state, TEAMS, QUARTER_LENGTHS) ->

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
    state = $state.current.name

#
#    check state before saving team
    if state == 'settings.homeTeam'
      console.log 'Home: ' + team
    else
      console.log 'Away: ' + team

#
#  save quarter length
  settings.saveTime = (time) ->
    console.log time

#
#  save sound effect settings
  settings.saveSounds = (bool) ->
    console.log bool

  return settings
