class ProfilesController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
  end

  private

    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = User.find(current_user.id)
      end
    end

    def profile_params
      params.permit(:first_name, :last_name, :favorite_team, :email, :password, :password_confirmation, :role)
    end
end
