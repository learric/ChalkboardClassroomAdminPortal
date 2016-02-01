angular.module('collegiateRivals')

.directive 'awayTeamNickname', (SettingsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      team = SettingsFactory.getFullAwayTeam()

      el.text(team.nickname)
      el.addClass(team.class)
  }

.directive 'homeTeamNickname', (SettingsFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      team = SettingsFactory.getFullHomeTeam()

      el.text(team.nickname)
      el.addClass(team.class)
  }

.directive 'activeTeamNickname', (ActiveTeamFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      team = ActiveTeamFactory.getFullActiveTeam()

      el.addClass(team.class)
      el.text(team.nickname)
  }
