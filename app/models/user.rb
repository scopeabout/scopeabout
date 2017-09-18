class User < ApplicationRecord
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    square: '200x200#'
  }

  validates :name, :email, :password, :avatar, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 4..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :interests, presence: true
  validates_length_of :interests_word_count, minimum: 3, maximum: 10, too_short: "should at least be %{count} words", too_long: "should not be more than %{count} words"

  def create
    @user = User.new(user_params)
  end

  private

  def interests_word_count
    interests.scan(/\w+/)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password, :interests)
  end
end
