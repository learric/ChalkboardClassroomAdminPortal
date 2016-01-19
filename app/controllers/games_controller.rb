class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_redirect

  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/collegiate_rivals
  # GET /games/collegiate_rivals.json
  def collegiate_rivals
    @student = Student.where(user_id: current_user.id)
  end

  private

    def user_redirect
      unless user_signed_in?
        redirect_to new_user_session
      end
    end
end
