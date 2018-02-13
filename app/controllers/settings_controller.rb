class SettingsController < ApplicationController
  before_action :set_user, only: [:edit_password, :update_password]

  def index
  end

  def edit_password
  end

  def update_password
    if @user.authenticate(params[:old_password])
      @user.password = user_params[:password]
      @user.password_confirmation = user_params[:password_confirmation]
      if @user.save(context: :password_update)
        @notice = 'Password has been successfully updated!'
      end
    else
      @user.errors.add(:old_password, 'is incorrect')
    end

    render :edit_password
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
