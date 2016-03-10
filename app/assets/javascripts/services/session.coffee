angular.module('services')

.factory('SessionFactory', ($http, ScoreFactory, SettingsFactory) ->

  session = {}

  return {
    setSession: ->
      session = $http({
        method: 'GET'
        url: '/games/game_session.json'
      }).then((res) ->
        session = res.data
        return session
      )

    getSession: ->
      return session

    setWinsLosses: (result) ->
      wins = session.user.game_wins
      losses = session.user.game_losses
      id = session.user.id

      if result == 0
        wins += 1
      else if result == 1
        losses += 1

      $http({
        method: 'PATCH'
        url: '/schools/edit_user/' + id + '.json'
        data: {
          user: {
            game_wins: wins
            game_losses: losses
          }
        }
      })

    sendRewardEmail: ->
      scores = ScoreFactory.getFinalScore()
      home = SettingsFactory.getFullHomeTeam()
      away = SettingsFactory.getFullAwayTeam()
      firstName = session.user.first_name
      email = session.user.email

      if scores.home < scores.away
        winningScore = scores.away
        losingScore = scores.home
        winningTeam = away.nickname + ' ' + away.mascot
        losingTeam = home.nickname + ' ' + home.mascot
      else
        winningScore = scores.home
        losingScore = scores.away
        winningTeam = home.nickname + ' ' + home.mascot
        losingTeam = away.nickname + ' ' + away.mascot

      $http({
        method: 'POST'
        url: '/rewards/send_email.json'
        data: {
          reward: {
            first_name: firstName
            email: email
            winning_team: winningTeam
            losing_team: losingTeam
            winning_score: winningScore
            losing_score: losingScore
          }
        }
      })
  }
)