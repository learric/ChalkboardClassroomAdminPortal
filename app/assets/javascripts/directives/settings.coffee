angular.module('collegiateRivals')

.directive 'teamChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-repeat="team in settings.teams" ng-click="settings.saveTeam($index)">{{ team.nickname }}</li>'
  }

.directive 'quarterChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-repeat="times in settings.quarterLengths" ng-click="settings.saveTime(times)">{{ times }}</li>'
  }

.directive 'soundChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-click="settings.saveSounds(true)">On</li><li ng-click="settings.saveSounds(false)">Off</li>'
  }

.directive 'settingsButton', ($state) ->
  return {
    restrict: 'EAC'
    link: (sc, el) ->
      el.on('click', ->
        state = $state.current.url

        switch state
          when '/homeTeam' then $state.go('settings.awayTeam')
          when '/awayTeam' then $state.go('settings.quarters')
          when '/quarters' then $state.go('settings.questions')
          when '/questions' then $state.go('settings.sounds')
          else $state.go('review')
      )
  }
