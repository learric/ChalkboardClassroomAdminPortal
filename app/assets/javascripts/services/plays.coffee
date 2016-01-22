angular.module('services')

.factory 'PlaysService', (PLAYS) ->

  plays = PLAYS.all
  play = {}

  return {
    setPlay: ->
      num = Math.floor(Math.random() * plays.length)
      play = plays[num]
      return play

    getPlay: ->
      return play

  }