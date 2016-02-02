angular.module('services')

.factory('SessionFactory', ($http) ->

  session = {}

  return {
    setSession: (url) ->
      session = $http({
        method: 'GET'
        url: '/games/' + url + '.json'
      }).then((res) ->
        session = res.data
        return session
      )

    getSession: ->
      return session

    setWinsLosses: (id, result) ->
      wins = session.student[0].game_wins
      losses = session.student[0].game_losses

      if result == 0
        wins += 1
      else if result == 1
        losses += 1

      $http({
        method: 'PUT'
        url: '/students/' + id + '.json'
        data: {
          game_wins: wins
          game_losses: losses
        }
      }).then((res) ->
        console.log res
      )
  }
)