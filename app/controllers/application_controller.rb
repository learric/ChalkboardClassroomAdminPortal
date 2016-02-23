class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_user_session

  private

    def get_user_session
      id = current_user.id
      @user = User.find(id)
    end
end
