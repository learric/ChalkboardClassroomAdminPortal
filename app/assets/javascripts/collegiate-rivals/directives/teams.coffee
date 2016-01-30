angular.module('collegiateRivals')

.directive 'awayTeamNickname', (SettingsFactory, TEAMS) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      id = SettingsFactory.getAwayTeam()
      team = TEAMS.sec[id]

      el.text(team.nickname)
      el.addClass(team.class)
  }
