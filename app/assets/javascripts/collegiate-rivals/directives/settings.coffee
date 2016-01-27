angular.module('collegiateRivals')

.directive 'teamChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-repeat="team in settings.teams.sec" ng-click="settings.saveTeam($index)" settings-button>{{ team.nickname }}</li>'
  }

.directive 'quarterChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-repeat="times in settings.quarterLengths" ng-click="settings.saveTime(times)" settings-button>{{ times }}</li>'
  }

.directive 'questionChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-click="settings.saveQuestions(0)" settings-button>Default</li> <li ng-repeat="teacher in settings.listTeachers.teachers" ng-click="settings.saveQuestions(teacher.id)" settings-button>{{ teacher.classroom_name }}</li>'
  }

.directive 'soundChoices', ->
  return {
    restrict: 'EAC'
    template: '<li ng-click="settings.saveSounds(true)" settings-button>On</li><li ng-click="settings.saveSounds(false)" settings-button>Off</li>'
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
