class CreateOrganizationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_users do |t|
      t.string :name
      t.string :email
      t.index :email
      t.string :description
      t.string :interests
      t.string :password_digest
      t.string :remember_digest
      t.string :current_job
    end

    add_reference :organization_users, :organization, foreign_key: true
  end
end
