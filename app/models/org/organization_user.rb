module Org
  class OrganizationUser < ApplicationRecord
    belongs_to :organizations

    attr_accessor :remember_token

    has_secure_password

    validates :name, :email, :current_job, :current_organization, :interests, presence: true
    validates :email, uniqueness: true
    validates :current_job, :current_organization, length: { maximum: 50 }

    validates :password, presence: true, on: :create
    validates :password, length: {in: 4..20}, on: :create
    validates :password, confirmation: true , on: :create
    validates :password_confirmation, presence: true , on: :create

    validates :password, presence: true, on: :password_update
    validates :password, length: {in: 4..20}, on: :password_update
    validates :password, confirmation: true , on: :password_update
    validates :password_confirmation, presence: true , on: :password_update

    validates :description, length: {maximum: 500}

    validates_length_of :interests_word_count, minimum: 3, maximum: 10,
                        too_short: "should at least be %{count} words",
                        too_long: "should not be more than %{count} words",
                        if: -> { interests.present? }

    def create
      @user = OrganizationUser.new(organization_user_params)
    end

    # Returns the hash digest of the given string.
    def OrganizationUser.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def OrganizationUser.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = OrganizationUser.new_token
      update_attribute(:remember_digest, OrganizationUser.digest(remember_token))
    end

    def forget
      update_attribute(:remember_digest, nil)
    end

    def authenticated?(remember_token)
      return false unless remember_digest
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def interest_list
      interests.split ' '
    end

    private

    def interests_word_count
      interests.scan(/\w+/)
    end

    def organization_user_params
      params.require(:organization_user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :interests,
                                   :description,
                                   :current_job,
                                   :current_organization)
    end
  end
end