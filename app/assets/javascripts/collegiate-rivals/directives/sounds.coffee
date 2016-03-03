angular.module('collegiateRivals')

.directive 'cheerSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playCheer()
      )

  }

.directive 'correctBellSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playCorrectBell()
      )

  }

.directive 'crowdSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playCrowd()
      )

  }

.directive 'incorrectBuzzerSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playIncorrectBuzzer()
      )

  }

.directive 'roarSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playRoar()
      )

  }

.directive 'touchdownSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playTouchdown()
      )

  }

.directive 'whistleSoundEffect', (SoundsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        SoundsFactory.playWhistle()
      )

  }

.directive 'activeFightSongSoundEffect', (SoundsFactory, ActiveTeamFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        active = ActiveTeamFactory.getActiveTeam()
        if active == 1
          SoundsFactory.playAwayFightSong('short')
        else
          SoundsFactory.playHomeFightSong('short')
      )
  }