angular.module('controllers')

.controller 'PlaysController', (PlaysService) ->

  plays = this

  plays.playList = PlaysService.setPlay()

  return plays
