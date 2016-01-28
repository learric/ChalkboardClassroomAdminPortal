angular.module('controllers')

.controller 'CoreController', (SessionFactory, QuestionsFactory, TeachersFactory, $scope) ->

  SessionFactory.getSession('collegiate_rivals').then((res) ->
    $scope.session = res.student[0]
  )

  $scope.toggleExitGamePopup = ->
    if $scope.showExitGamePopup
      $scope.showExitGamePopup = false
    else
      $scope.showExitGamePopup = true

# TODO: Get rid of this
  $scope.getQuestions = ->
    $scope.questions = QuestionsFactory.getQuestions()
