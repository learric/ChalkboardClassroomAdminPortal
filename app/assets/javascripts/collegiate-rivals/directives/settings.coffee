angular.module('collegiateRivals')

.directive 'homeTeamChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="team_selection_list"><li ng-repeat="team in settings.teams.sec" ng-click="settings.saveTeam($index)" settings-button><img ng-src="/assets/teams/home/{{ team.logo }}.png" /></li></ul>'
  }

.directive 'awayTeamChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="team_selection_list"><li ng-repeat="team in settings.teams.sec" ng-click="settings.saveTeam($index)" settings-button><img ng-src="/assets/teams/away/{{ team.logo }}.png" /></li></ul>'
  }

.directive 'quarterChoices', ->
  return {
    restrict: 'EAC'
    template: '<section class="time_selection_list" ng-repeat="times in settings.quarterLengths" ng-click="settings.saveTime(times)" settings-button><p>{{ times }}:00</p></section>'
  }

.directive 'questionChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="opaque_box_selection_list"><li ng-repeat="teacher in settings.listTeachers.teachers" ng-click="settings.saveQuestions(teacher.id)" settings-button>{{ teacher.classroom_name }}</li> <li ng-click="settings.saveQuestions(0)" settings-button>Default</li></ul>'
  }

.directive 'soundChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="opaque_box_selection_list"><li ng-click="settings.saveSounds(true)" settings-button>On</li><li ng-click="settings.saveSounds(false)" settings-button>Off</li></ul>'
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
