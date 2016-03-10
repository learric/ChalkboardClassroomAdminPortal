angular.module('controllers')

.controller 'CoreController', (SessionFactory, QuestionsFactory, $scope) ->

  SessionFactory.setSession().then((res) ->
    $scope.user = res.user
    $scope.school = res.school
    $scope.classrooms = res.classrooms
  )

  $scope.toggleExitGamePopup = ->
    if $scope.showExitGamePopup
      $scope.showExitGamePopup = false
    else
      $scope.showExitGamePopup = true
