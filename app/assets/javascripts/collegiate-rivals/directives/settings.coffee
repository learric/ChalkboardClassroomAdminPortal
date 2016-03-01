angular.module('collegiateRivals')

.directive 'homeTeamChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="team_selection_list"><li class="animated infinite pulse" ng-repeat="team in settings.teams.sec" ng-click="settings.saveTeam($index)" settings-button><img ng-src="/images/teams/home/{{ team.logo }}.png" /></li></ul>'
  }

.directive 'awayTeamChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="team_selection_list"><li class="animated infinite pulse" ng-repeat="team in settings.teams.sec" ng-click="settings.saveTeam($index)" settings-button><img ng-src="/images/teams/away/{{ team.logo }}.png" /></li></ul>'
  }

.directive 'quarterChoices', ->
  return {
    restrict: 'EAC'
    template: '<section class="time_selection_list animated rubberBand" ng-repeat="times in settings.quarterLengths" ng-click="settings.saveTime(times)" settings-button><p>{{ times }}:00</p></section>'
  }

.directive 'questionChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="opaque_box_selection_list"><li class="animated rubberBand" ng-repeat="classroom in classrooms" ng-click="settings.saveQuestions(classroom.id)" settings-button>{{ classroom.name }}</li> <li class="animated rubberBand" ng-click="settings.saveQuestions(0)" settings-button>Default</li></ul>'
  }

.directive 'soundChoices', ->
  return {
    restrict: 'EAC'
    template: '<ul class="opaque_box_selection_list"><li class="animated rubberBand" ng-click="settings.saveSounds(true)" settings-button>On</li><li class="animated rubberBand" ng-click="settings.saveSounds(false)" settings-button>Off</li></ul>'
  }
