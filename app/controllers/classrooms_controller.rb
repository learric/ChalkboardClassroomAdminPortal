class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /classrooms
  # GET /classrooms.json
  def index
    if @user.role == 1
      @classrooms = Classroom.where(user_id: @user.id)
    elsif @user.role == 2
      @classrooms = Classroom.where(school_id: @user.school_id)
      @teachers = []

      @classrooms.each do |classroom|
        teacher = User.find(classroom.user_id)
        @teachers.push(teacher)
      end
    else
      redirect_to root_path
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.school_id = @user.school_id

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_path, notice: 'Classroom was successfully created.' }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classrooms_url, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.classroom_users.destroy_all
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def set_user
      id = current_user.id
      @user = User.find(id)
      @teachers = User.where(school_id: @user.school_id, role: 1)

      unless @user.role > 0
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:name, :subject, :school_id, :user_id)
    end
end
