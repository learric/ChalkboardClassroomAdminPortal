angular.module('collegiateRivals')

.directive 'homeTeamLogo', (ActiveTeamFactory, SettingsFactory) ->
  return {
    restrict: 'EAC'
    template: '<img src="/assets/teams/home/{{ scoreboard.homeTeamLogo }}.png" />'
    link: (sc, el) ->
      active = ActiveTeamFactory.getActiveTeam()
      team = SettingsFactory.getFullHomeTeam()

      if active == 1
        sc.scoreboard.homeTeamLogo = team.logo + '-bw'
        el.removeClass('animated pulse infinite')
      else
        sc.scoreboard.homeTeamLogo = team.logo
        el.addClass('animated pulse infinite')
  }

.directive 'awayTeamLogo', (ActiveTeamFactory, SettingsFactory) ->
  return {
    restrict: 'EAC'
    template: '<img src="/assets/teams/away/{{ scoreboard.awayTeamLogo }}.png" />'
    link: (sc, el) ->
      active = ActiveTeamFactory.getActiveTeam()
      team = SettingsFactory.getFullAwayTeam()

      if active == 0
        sc.scoreboard.awayTeamLogo = team.logo + '-bw'
        el.removeClass('animated pulse infinite')
      else
        sc.scoreboard.awayTeamLogo = team.logo
        el.addClass('animated pulse infinite')
  }

.directive 'homeTeamScore', (ScoreFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      score = ScoreFactory.getHomeScore()

      if score < 10
        score = '0' + score

      el.text(score)
  }

.directive 'awayTeamScore', (ScoreFactory) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      score = ScoreFactory.getAwayScore()

      if score < 10
        score = '0' + score

      el.text(score)
  }
