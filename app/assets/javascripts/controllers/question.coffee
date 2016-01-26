angular.module('controllers')

.controller 'QuestionController', (QuestionsFactory, QUESTIONS) ->

  question = this

  teacherId = QuestionsFactory.getTeacherId()

  if teacherId == 0
    question.questionList = QUESTIONS.default
  else
    getQuestions = QuestionsFactory.getQuestionsLocally()

    if Object.keys(getQuestions).length == 0
      QuestionsFactory.getQuestions().then((res) ->
        question.questionList = res.questions
      )
    else
      question.questionList = QuestionsFactory.getQuestionsLocally()

  return question
