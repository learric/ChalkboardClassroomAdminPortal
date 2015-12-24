class StaticPagesController < ApplicationController
  def index
    @user = false
    if user_signed_in?
      @user = true
    end
  end
end
