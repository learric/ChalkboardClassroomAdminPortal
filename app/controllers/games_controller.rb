class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user_session

  before_action :set_user, only: [:game_session]
  before_action :set_school, only: [:game_session]
  before_action :set_classrooms, only: [:game_session]
  before_action :set_questions, only: [:game_session_questions]

  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/collegiate_rivals
  # GET /games/collegiate_rivals.json
  def collegiate_rivals
  end

  def game_session

  end

  def game_session_questions

  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def set_school
      @school = School.find(@user.school_id)
    end

    def set_classrooms
      if @user.role == 2
        @classrooms = Classroom.where(school_id: @user.school_id)
      elsif @user.role == 1
        @classrooms = Classroom.where(user_id: @user.id)
      else
        classrooms = ClassroomUser.where(user_id: @user.id)

        @classrooms = []

        classrooms.each do |classroom|
          room = Classroom.find(classroom.classroom_id)
          @classrooms.push(room)
        end
      end
    end

    def set_questions
      @questions = Question.where(classroom_id: params[:id])
    end

end
