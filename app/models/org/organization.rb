module Org
  class Organization < ApplicationRecord
    belongs_to :owner, class_name: 'Org::OrganizationUser', foreign_key: 'owner_id'
    has_many :organization_users, class_name: 'Org::OrganizationUser'
    has_many :session_feeds, class_name: 'Org::SessionFeed', through: :organization_users
  end
end
