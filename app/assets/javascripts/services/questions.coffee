angular.module('services')

.factory 'QuestionsFactory', ($http) ->

  teacher = 0
  questions = {}

  return {
    setTeacherId: (id) ->
      teacher = id

    getQuestions: ->
      if teacher > 0
        $http({
          method: 'GET'
          url: '/games/questions/' + teacher + '.json'
        }).then((res) ->
          questions = res.data
          return questions
        )
      else
        questions = 0

    getQuestionsLocally: ->
        return questions

  }
