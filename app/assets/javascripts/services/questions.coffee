angular.module('services')

.factory 'QuestionsFactory', ($http) ->

  return {
    getQuestions: ->
      questions = $http({
        method: 'GET'
        url: '/games/questions.json'
      }).then((res) ->
        questions = res.data
        return questions
      )
  }
