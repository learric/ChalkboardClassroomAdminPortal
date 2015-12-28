class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_user_teacher?
  before_action :is_user_admin?, except: [:show, :edit, :update]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    if @is_admin
      set_teacher
    else
      @teacher = Teacher.where(user_id: current_user.id)
      if @teacher.user_id != current_user.id
        render 'questions/errors'
      end
    end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name_prefix, :name_first, :name_last, :school_name, :school_location, :school_city, :school_state, :classroom_name, :classroom_location, :classroom_description)
    end

    def is_user_teacher?
      @is_teacher = TeachersHelper.is_teacher?(current_user)
      unless @is_teacher
        respond_to do |format|
          format.html { render 'teachers/errors'}
        end
      end
    end

    def is_user_admin?
      @is_admin = TeachersHelper.is_teacher_admin?(current_user)
      unless @is_admin
        respond_to do |format|
          format.html { render 'teachers/errors'}
        end
      end
    end
end
