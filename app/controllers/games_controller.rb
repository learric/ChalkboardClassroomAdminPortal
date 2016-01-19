class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_redirect

  # GET /games
  # GET /games.json
  def index
  end

  def collegiate_rivals
    @user = current_user
    @student = Student.where(user_id: current_user.id)
  end

  private

    def user_redirect
      unless user_signed_in?
        redirect_to new_user_session
      end
    end
end
