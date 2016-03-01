angular.module('controllers')

.controller 'QuestionController', (QuestionsFactory, QUESTIONS) ->

  question = this

  teacherId = QuestionsFactory.getTeacherId()

  if teacherId == 0
    qRand = Math.floor(Math.random() * QUESTIONS.default.length)
    question.questionList = QUESTIONS.default[qRand]
  else
    getQuestions = QuestionsFactory.getQuestionsLocally()

    qRand = Math.floor(Math.random() * getQuestions.questions.length)
    question.questionList = getQuestions.questions[qRand]

  random = Math.floor(Math.random() * 4)

  switch random
    when 0 then question.questionOrder = [0, 1, 2, 3]
    when 1 then question.questionOrder = [1, 2, 3, 0]
    when 2 then question.questionOrder = [2, 3, 0, 1]
    else question.questionOrder = [3, 2, 1, 0]

  return question
