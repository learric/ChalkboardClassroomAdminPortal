angular.module('collegiateRivals')

.controller 'ReviewController', (SettingsFactory, $scope, TEAMS) ->

  review = this

  home = SettingsFactory.getHomeTeam()
  away = SettingsFactory.getAwayTeam()

  review.homeTeam = TEAMS.sec[home]
  review.awayTeam = TEAMS.sec[away]
  review.quarterLength = SettingsFactory.getTime()
  review.sounds = SettingsFactory.getSounds()

  return review
