angular.module('collegiateRivals')

.controller 'CoreController', (SessionFactory, QuestionsFactory, TeachersFactory, $scope) ->

  getSession = SessionFactory.getSession('collegiate_rivals')

  $scope.session = getSession.$$state

# TODO: Get rid of this
  $scope.getQuestions = ->
    $scope.questions = QuestionsFactory.getQuestions()
