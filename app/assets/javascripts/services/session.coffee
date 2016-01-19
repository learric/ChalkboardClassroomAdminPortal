angular.module('services')

.factory('SessionFactory', ($http) ->
  return {
    getSession: (url) ->
      session = $http({
        method: 'GET'
        url: '/games/' + url + '.json'
      }).then((res) ->
        session = res.data
        return session
      )
  }
)