angular.module('services')

.factory 'SettingsFactory', (TEAMS) ->

  home = 0
  away = 1
  time = 1
  teacher = 0
  sounds = true

  return {

#
#    save settings
    saveHomeTeam: (id) ->
      home = id

    saveAwayTeam: (id) ->
      away = id

    saveTime: (num) ->
      time = num

    saveTeacher: (id) ->
      teacher = id

    saveSounds: (bool) ->
      sounds = bool

#
#    get settings
    getHomeTeam: ->
      return home

    getFullHomeTeam: ->
      fullHome = TEAMS.sec[home]
      return fullHome

    getAwayTeam: ->
      return away

    getFullAwayTeam: ->
      fullAway = TEAMS.sec[away]
      return fullAway

    getTime: ->
      return time

    getTeacher: ->
      return teacher

    getSounds: ->
      return sounds
  }