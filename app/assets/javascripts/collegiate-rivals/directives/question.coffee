angular.module('collegiateRivals')

.directive 'firstAnswer', (SoundsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<div><span>A</span><span>{{ question.questionList.answers[question.questionOrder[0]] }}</span></div>'
    link: (sc, el) ->
      answer = sc.question.questionOrder[0]

      el.on('click', ->
        if answer == 3
          SoundsFactory.playCorrectBell()
          $state.go('question.correct')
        else
          SoundsFactory.playIncorrectBuzzer()
          $state.go('question.incorrect')
      )
  }

.directive 'secondAnswer', (SoundsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<div><span>B</span><span>{{ question.questionList.answers[question.questionOrder[1]] }}</span></div>'
    link: (sc, el) ->
      answer = sc.question.questionOrder[1]

      el.on('click', ->
        if answer == 3
          SoundsFactory.playCorrectBell()
          $state.go('question.correct')
        else
          SoundsFactory.playIncorrectBuzzer()
          $state.go('question.incorrect')
      )
  }

.directive 'thirdAnswer', (SoundsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<div><span>C</span><span>{{ question.questionList.answers[question.questionOrder[2]] }}</span></div>'
    link: (sc, el) ->
      answer = sc.question.questionOrder[2]

      el.on('click', ->
        if answer == 3
          SoundsFactory.playCorrectBell()
          $state.go('question.correct')
        else
          SoundsFactory.playIncorrectBuzzer()
          $state.go('question.incorrect')
      )
  }

.directive 'fourthAnswer', (SoundsFactory, $state) ->
  return {
    restrict: 'EAC'
    template: '<div><span>D</span><span>{{ question.questionList.answers[question.questionOrder[3]] }}</span></div>'
    link: (sc, el) ->
      answer = sc.question.questionOrder[3]

      el.on('click', ->
        if answer == 3
          SoundsFactory.playCorrectBell()
          $state.go('question.correct')
        else
          SoundsFactory.playIncorrectBuzzer()
          $state.go('question.incorrect')
      )
  }

.directive 'incorrectButton', (ActiveTeamFactory, $state) ->
  return {
    restrict: 'EAC'
    template: 'Next'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button animated rubberBand')
      el.on('click', ->
        ActiveTeamFactory.toggleActiveTeam()
        $state.go('gameplay.newplay')
      )
  }

.directive 'correctButton', (SoundsFactory, PlaysService, $state) ->
  return {
    restrict: 'EAC'
    template: 'Next'
    link: (sc, el) ->
      el.addClass('btn btn-success right_button animated rubberBand')
      el.on('click', ->
        SoundsFactory.playCheer()
        PlaysService.setPlay()
        $state.go('play.new')
      )
  }
