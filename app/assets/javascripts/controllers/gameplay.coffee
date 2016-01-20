angular.module('collegiateRivals')

.controller 'GameplayController', (GameplayFactory) ->

  gameplay = this

  activeTeam = GameplayFactory.getActiveTeam()

  console.log activeTeam

  return gameplay
