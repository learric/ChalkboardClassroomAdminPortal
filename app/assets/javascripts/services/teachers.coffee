angular.module('services')

.factory 'TeachersFactory', ($http) ->

  return {
    getTeachers: ->
      teachers = $http({
        method: 'GET'
        url: '/games/teachers.json'
      }).then((res) ->
        teachers = res.data
        return teachers
      )
  }
