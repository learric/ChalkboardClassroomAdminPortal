class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:edit_user, :update_user]

  # GET /schools
  # GET /schools.json
  def index
    # @schools = School.all
    @schools = School.find_by(id: @user.school_id)
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to schools_path, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def teachers
    school = @user.school_id
    @teachers = User.where(school_id: school, role: 1)
  end

  def students
    school = @user.school_id
    @students = User.where(school_id: school, role: 0)
  end

  def new_user
    @new_user = User.new
  end

  def create_new_user
    @new_user = User.new(user_params)
    @new_user.school_id = @user.school_id

    respond_to do |format|
      if @new_user.save
        if @new_user.role == 1
          format.html { redirect_to schools_teachers_path, notice: 'Teacher was successfully created.' }
        else
          format.html { redirect_to schools_students_path, notice: 'Student was successfully created.' }
        end

        format.json { render :index, status: :created }
      else
        format.html { render :new_user }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        if @user.role == 1
          format.html { redirect_to schools_teachers_path, notice: 'Teacher was successfully updated.' }
          format.json { render json: @user, status: :ok }
        else
          format.html { redirect_to schools_students_path, notice: 'Student was successfully updated.' }
          format.json { render json: @user, status: :ok }
        end
      else
        format.html { render :edit_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_user
    @user = User.find(params[:id])
    @user.classroom_users.destroy_all
    @user.destroy
    respond_to do |format|
      if @user.role == 1
        format.html { redirect_to schools_teachers_path, notice: 'Teacher was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to schools_students_path, notice: 'Student was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :address, :city, :state, :zip, :mascot)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :game_wins, :game_losses)
    end

    def set_user
      id = current_user.id
      @user = User.find(id)

      unless @user.role == 2
        redirect_to root_path
      end
    end
end
