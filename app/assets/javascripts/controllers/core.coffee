angular.module('collegiateRivals')

.controller 'CoreController', (SessionFactory, $scope) ->

  getSession = SessionFactory.getSession('collegiate_rivals')

  $scope.session = getSession.$$state
