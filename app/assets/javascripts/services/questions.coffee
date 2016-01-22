angular.module('services')

.factory 'QuestionsFactory', ($http) ->

  teacher = 0
  questions = {}

  return {
    setTeacherId: (id) ->
      teacher = id

    getTeacherId: ->
      return teacher

    getQuestions: ->
      $http({
        method: 'GET'
        url: '/games/questions/' + teacher + '.json'
      }).then((res) ->
        questions = res.data
        return questions
      )

    getQuestionsLocally: ->
        return questions

  }
