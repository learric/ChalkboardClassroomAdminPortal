class GamesController < ApplicationController
  respond_to :json

  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/questions
  # GET /games/questions.json
  def questions
    @questions = Question.all
  end
end
