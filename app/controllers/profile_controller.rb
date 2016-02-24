class ProfileController < ApplicationController
  before_action :set_user

  def show

  end

  def edit

  end

  def update

  end

  private

    def set_user
      id = current_user.id
      @user = User.find(id)
    end
end
