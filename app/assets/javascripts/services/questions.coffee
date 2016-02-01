angular.module('services')

.factory 'QuestionsFactory', ($http) ->

  teacher = 0
  question = {}

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
        question = res.data
        return question
      )

    getQuestionsLocally: ->
        return question

  }
