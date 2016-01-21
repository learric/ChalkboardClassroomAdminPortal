angular.module('collegiateRivals')

.controller 'CoreController', (SessionFactory, QuestionsFactory, $scope) ->

  getSession = SessionFactory.getSession('collegiate_rivals')

  getQuestions = QuestionsFactory.getQuestions()

  $scope.session = getSession.$$state

  $scope.questions = getQuestions.$$state
