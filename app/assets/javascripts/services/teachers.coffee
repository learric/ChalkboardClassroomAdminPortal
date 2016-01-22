angular.module('services')

.factory 'TeachersFactory', ($http) ->

  teachers = {}

  return {
    setTeachers: ->
      $http({
        method: 'GET'
        url: '/games/teachers.json'
      }).then((res) ->
        teachers = res.data
        return teachers
      )

    getTeachers: ->
      return teachers

    singleTeacher: (id) ->
      listTeachers = teachers.teachers

      newTeacher = (teacher) ->
        return teacher

      if id == 0
        return 0
      else
        newTeacher teacher for teacher in listTeachers when teacher.id is id

  }
