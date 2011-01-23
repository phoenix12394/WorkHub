# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110115184356) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "category_id"
    t.integer  "compensation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["category_id"], :name => "index_microposts_on_category_id"
  add_index "microposts", ["location_id"], :name => "index_microposts_on_location_id"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "microposts_tags", :id => false, :force => true do |t|
    t.integer "micropost_id", :null => false
    t.integer "tag_id",       :null => false
  end

  add_index "microposts_tags", ["micropost_id", "tag_id"], :name => "index_microposts_tags_on_micropost_id_and_tag_id", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_users", :id => false, :force => true do |t|
    t.integer "tag_id",  :null => false
    t.integer "user_id", :null => false
  end

  add_index "tags_users", ["tag_id", "user_id"], :name => "index_tags_users_on_tag_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
