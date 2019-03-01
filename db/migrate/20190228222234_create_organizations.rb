class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :subdomain, limit: 32
      t.string :name
      t.integer :owner_id
    end

    add_index :organizations, :subdomain, unique: true
  end
end
