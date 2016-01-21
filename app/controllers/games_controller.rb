class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_redirect
  before_action :teacher_student_assoc, only: [:teachers]
  before_action :find_questions, only: [:questions]

  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/collegiate_rivals
  # GET /games/collegiate_rivals.json
  def collegiate_rivals
    @student = Student.where(user_id: current_user.id)
  end

  # GET /games/teachers.json
  def teachers
  end

  # GET /games/questions.json
  def questions
  end

  private

    def user_redirect
      unless user_signed_in?
        redirect_to new_user_session
      end
    end

    def teacher_student_assoc
      if current_user
        id = current_user.id
        classrooms = StudentClassroom.where(student_id: id)
        teachers = []

        classrooms.each do |t|
          teachers.push(t.teacher_id)
        end

        get_teachers teachers.uniq

      end
    end

    def get_teachers teachers
      @teachers = []

      teachers.each do |t|
        teacher = Teacher.find(t)
        @teachers.push(teacher)
      end
    end

    def find_questions
      teacher = params[:teacher]
      @questions = Question.where(teacher_id: teacher)
    end
end
