angular.module('services')

.factory 'QuestionsFactory', ($http) ->

  questionId = 0
  question = {}

  return {
    setTeacherId: (id) ->
      questionId = id

    getTeacherId: ->
      return questionId

    getQuestions: (id) ->
      $http({
        method: 'GET'
        url: '/games/game_session_questions/' + id + '.json'
      }).then((res) ->
        question = res.data
        return question
      )

    getQuestionsLocally: ->
        return question

  }
