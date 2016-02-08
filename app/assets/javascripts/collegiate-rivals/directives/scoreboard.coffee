angular.module('collegiateRivals')

.directive 'homeTeamLogo', (ActiveTeamFactory, SettingsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<img src="/images/teams/home/{{ scoreboard.homeTeamLogo }}.png" />'
    link: (sc, el) ->
      active = ActiveTeamFactory.getActiveTeam()
      team = SettingsFactory.getFullHomeTeam()
      state = $state.current.name

      if active == 1 || state == 'gameplay.kickoff'
        sc.scoreboard.homeTeamLogo = team.logo + '-bw'
        el.removeClass('animated pulse infinite')
      else
        sc.scoreboard.homeTeamLogo = team.logo
        el.addClass('animated pulse infinite')
  }

.directive 'awayTeamLogo', (ActiveTeamFactory, SettingsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<img src="/images/teams/away/{{ scoreboard.awayTeamLogo }}.png" />'
    link: (sc, el) ->
      active = ActiveTeamFactory.getActiveTeam()
      team = SettingsFactory.getFullAwayTeam()
      state = $state.current.name

      if active == 0 || state == 'gameplay.kickoff'
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
