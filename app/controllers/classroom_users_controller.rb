class ClassroomUsersController < ApplicationController
  before_action :set_classroom_user, only: [:show, :edit, :update, :destroy]

  # GET /classroom_users
  # GET /classroom_users.json
  def index
    @classroom_users = ClassroomUser.all
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
        format.html { redirect_to @classroom_user, notice: 'Classroom user was successfully created.' }
        format.json { render :show, status: :created, location: @classroom_user }
      else
        format.html { render :new }
        format.json { render json: @classroom_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_users/1
  # PATCH/PUT /classroom_users/1.json
  def update
    respond_to do |format|
      if @classroom_user.update(classroom_user_params)
        format.html { redirect_to @classroom_user, notice: 'Classroom user was successfully updated.' }
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
      format.html { redirect_to classroom_users_url, notice: 'Classroom user was successfully destroyed.' }
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
      params.fetch(:classroom_user, {})
    end
end
