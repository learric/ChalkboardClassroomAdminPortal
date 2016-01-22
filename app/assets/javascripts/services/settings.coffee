angular.module('services')

.factory 'SettingsFactory', ->

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

    getAwayTeam: ->
      return away

    getTime: ->
      return time

    getTeacher: ->
      return teacher

    getSounds: ->
      return sounds
  }