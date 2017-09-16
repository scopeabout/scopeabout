class AddAvatarToUsers < ActiveRecord::Migration[5.1]
  def self.up
    remove_column :users, :avatar_url
    add_attachment :users, :avatar
  end

  def self.down
    add_column :users, :avatar_url, :string, limit: 1024
    remove_attachment :users, :avatar
  end
end
