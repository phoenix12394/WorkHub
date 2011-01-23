class CreateMicropostsTags < ActiveRecord::Migration
  def self.up
    create_table :microposts_tags, :id => false do |t|
      t.integer :micropost_id, :null => false
      t.integer :tag_id, :null => false
    end
    add_index :microposts_tags, [:micropost_id, :tag_id], :unique => true
  end

  def self.down
    remove_index :microposts_tags, :column => [:micropost_id, :tag_id]
    drop_table :microposts_tags
  end
end
