class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password, limit: 32
      t.string :avatar_url, limit: 1024

      t.timestamps
    end
  end
end
