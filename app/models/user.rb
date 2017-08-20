class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 4..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
  end
end
