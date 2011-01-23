class CreateTagsUsers < ActiveRecord::Migration
  def self.up
    create_table :tags_users, :id => false do |t|
      t.integer :tag_id, :null => false
      t.integer :user_id, :null => false
      
    end
    add_index :tags_users, [:tag_id, :user_id], :unique => true
  end

  def self.down
    remove_index :tags_users, :column => [:tag_id, :user_id]
    drop_table :tags_users
  end
end
