class SettingsController < ApplicationController
  before_action :set_user, only: [:index, :update_password]

  def index
  end

  def update_password
    if @user.authenticate(params[:old_password])
      if @user.update(user_params)
        @notice = 'Password has been successfully updated!'
      end
    else
      @user.errors.add(:old_password, 'is not matching')
    end

    render :index
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
