angular.module('collegiateRivals')

.controller 'CoreController', ($scope, SessionFactory) ->

  getSession = SessionFactory.getSession('collegiate_rivals')

  $scope.session = getSession.$$state
