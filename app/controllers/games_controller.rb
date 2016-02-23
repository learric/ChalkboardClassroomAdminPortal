class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user_session

  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/collegiate_rivals
  # GET /games/collegiate_rivals.json
  def collegiate_rivals
  end

end
