angular.module('services')

.factory('SessionFactory', ($http) ->

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
  }
)