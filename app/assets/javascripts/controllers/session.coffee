angular.module('collegiateRivals')

.controller 'SessionController', ($scope, SessionFactory) ->

  session = this

  getSession = SessionFactory.getSession('collegiate_rivals')

  $scope.session = getSession.$$state

  return session
