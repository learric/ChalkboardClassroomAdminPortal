angular.module('services')

.factory('SoundsFactory', (SettingsFactory) ->

  cheer = new buzz.sound('/sounds/cheer', {
    formats: ['ogg', 'mp3']
  })

  correctBell = new buzz.sound('/sounds/correct_bell', {
    formats: ['ogg', 'mp3']
  })

  crowd = new buzz.sound('/sounds/crowd', {
    formats: ['ogg', 'mp3']
  })

  incorrectBuzzer = new buzz.sound('/sounds/incorrect_buzzer', {
    formats: ['ogg', 'mp3']
  })

  roar = new buzz.sound('/sounds/roar', {
    formats: ['ogg', 'mp3']
  })

  touchdown = new buzz.sound('/sounds/touchdown', {
    formats: ['ogg', 'mp3']
  })

  whistle = new buzz.sound('/sounds/whistle', {
    formats: ['ogg', 'mp3']
  })

  fightSong = (team, version) ->
    song = new buzz.sound('/sounds/' + team, {
      formats: ['ogg', 'mp3']
    })

    buzz.all().stop()

    if version == 'full'
      song.play().loop()
    else
      song.play().fadeOut(15000)

  return {
    playCheer: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        cheer.play().fadeOut()

    playCorrectBell: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        correctBell.play()

    playCrowd: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        crowd.play().fadeOut()

    playIncorrectBuzzer: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        incorrectBuzzer.play()

    playRoar: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        roar.play().fadeOut()

    playTouchdown: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        touchdown.play()

    playWhistle: ->
      mute = SettingsFactory.getSounds()
      if mute
        buzz.all().stop()
        whistle.play()

    playHomeFightSong: (version) ->
      mute = SettingsFactory.getSounds()
      if mute
        team = SettingsFactory.getFullHomeTeam()
        fightSong(team.class, version)

    playAwayFightSong: (version) ->
      mute = SettingsFactory.getSounds()
      if mute
        team = SettingsFactory.getFullAwayTeam()
        fightSong(team.class, version)
  }
)
