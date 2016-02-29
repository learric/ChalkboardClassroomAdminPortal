class ClassroomUsersController < ApplicationController
  before_action :set_classroom_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :get_students, only: [:index]
  before_action :set_classroom, only: [:index]
  before_action :get_all_students, only: [:index]

  # GET /classroom_users
  # GET /classroom_users.json
  def index
  end

  # GET /classroom_users/1
  # GET /classroom_users/1.json
  def show
  end

  # GET /classroom_users/new
  def new
    @classroom_user = ClassroomUser.new
  end

  # GET /classroom_users/1/edit
  def edit
  end

  # POST /classroom_users
  # POST /classroom_users.json
  def create
    @classroom_user = ClassroomUser.new(classroom_user_params)

    respond_to do |format|
      if @classroom_user.save
        format.html { redirect_to classroom_users_class_path(classroom_user_params[:classroom_id]), notice: 'Student was successfully added to class.' }
        format.json { render :show, status: :created, location: @classroom_user }
      else
        # format.html { render :new }
        format.html { redirect_to classroom_users_class_path(classroom_user_params[:classroom_id]), notice: 'Student is already in this class'}
        format.json { render json: @classroom_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_users/1
  # PATCH/PUT /classroom_users/1.json
  def update
    respond_to do |format|
      if @classroom_user.update(classroom_user_params)
        format.html { redirect_to @classroom_user, notice: 'Student was successfully added to class.' }
        format.json { render :show, status: :ok, location: @classroom_user }
      else
        format.html { render :edit }
        format.json { render json: @classroom_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classroom_users/1
  # DELETE /classroom_users/1.json
  def destroy
    @classroom_user.destroy
    respond_to do |format|
      format.html { redirect_to classroom_users_class_path(@classroom_user.classroom_id), notice: 'Student was successfully removed from class.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_user
      @classroom_user = ClassroomUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_user_params
      params.require(:classroom_users).permit(:classroom_id, :user_id)
    end

    def get_students
      @classroom_users = ClassroomUser.where(classroom_id: params[:id])

      @students = []

      @classroom_users.each do |user|
        student = User.find(user.user_id)
        student.classroom_id = user.id
        @students.push student
      end
    end

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def get_all_students
      user = User.find(current_user.id)
      id = user.school_id
      @all_students = User.where(school_id: id, role: 0)
    end
end
