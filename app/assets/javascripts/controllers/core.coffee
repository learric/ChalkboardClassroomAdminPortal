angular.module('controllers')

.controller 'CoreController', (SessionFactory, $scope) ->

  SessionFactory.setSession('collegiate_rivals').then((res) ->
    $scope.session = res.student[0]
  )

  $scope.toggleExitGamePopup = ->
    if $scope.showExitGamePopup
      $scope.showExitGamePopup = false
    else
      $scope.showExitGamePopup = true
