class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_admin, only: [:index]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  def classroom
    @questions = Question.where(classroom_id: params[:id])
    @classroom = Classroom.find(params[:id])
    render 'questions/index'
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new

    if params[:id]
      @classroom = Classroom.find(params[:id])
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_to new_classroom_question_path(question_params[:classroom_id]), notice: 'No fields can be left blank' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to classroom_questions_url(@question.classroom_id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:classroom_id, :school_id, :category, :first_line, :incorrect_one, :incorrect_two, :incorrect_three, :correct_answer)
    end

    def set_admin
      @user = User.find(current_user.id)
      unless @user.role == 2
        redirect_to classrooms_path
      end
    end
end
