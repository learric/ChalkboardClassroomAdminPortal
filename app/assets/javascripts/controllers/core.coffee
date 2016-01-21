angular.module('collegiateRivals')

.controller 'CoreController', (SessionFactory, QuestionsFactory, TeachersFactory, $scope) ->

  getSession = SessionFactory.getSession('collegiate_rivals')

  getTeachers = TeachersFactory.getTeachers()

  $scope.session = getSession.$$state

  $scope.teachers = getTeachers.$$state

  $scope.getQuestions = ->
    $scope.questions = QuestionsFactory.getQuestions()

  $scope.setLocalQuestions = ->
    $scope.localQuestions = QuestionsFactory.getQuestionsLocally()
