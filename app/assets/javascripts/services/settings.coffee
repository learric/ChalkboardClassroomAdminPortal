angular.module('services')

.factory 'SettingsFactory', ->

  home = 0
  away = 1
  time = 1
  questions = 0
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

    saveQuestions: (id) ->
      questions = id

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

    getQuestions: ->
      return questions

    getSounds: ->
      return sounds
  }