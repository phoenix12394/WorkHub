class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :location_id
      t.text :bio
      t.timestamps
    end
   add_index :users, :location_id

  end

  def self.down
    drop_table :users
  end
end
