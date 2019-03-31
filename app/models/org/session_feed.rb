module Org
  class SessionFeed < ApplicationRecord

    before_validation :set_user_track

    belongs_to :created_by, :class_name => 'Org::OrganizationUser', foreign_key: 'created_by_id'
    belongs_to :updated_by, :class_name => 'Org::OrganizationUser', foreign_key: 'updated_by_id'

    has_one_attached :attachment

    attr_accessor :current_user

    def set_user_track
      set_created_by if new_record?
      set_updated_by
      true
    end

    def set_created_by
      self.created_by = @current_user
      true
    end

    def set_updated_by
      self.updated_by = @current_user
      true
    end

  end
end