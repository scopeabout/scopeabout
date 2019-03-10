module Org
  class Organization < ApplicationRecord
    belongs_to :owner, class_name: 'OrganizationUser', foreign_key: 'owner_id'
  end
end
