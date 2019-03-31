class CreateSessionFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :session_feeds do |t|
      t.text :body
      t.integer :created_by_id
      t.integer :updated_by_id
      t.timestamps
    end
  end
end
