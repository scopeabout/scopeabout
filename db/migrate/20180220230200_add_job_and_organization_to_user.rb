class AddJobAndOrganizationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_job, :string
    add_column :users, :current_organization, :string
  end
end
