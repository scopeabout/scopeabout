class User < ApplicationRecord
  validates_confirmation_of :password
  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
