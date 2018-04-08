class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :edit_basic, :update_basic]
  before_action :authenticate

  def show
  end

  def edit_basic
  end

  def update_basic
    if @user.update(user_params)
      @notice = 'Profile update successfully!'
    end
    render :edit_basic
  end

  private

  def user_params
    params.require(:user).permit(:interests, :description)
  end

  def set_user
    @user = current_user
  end
end
