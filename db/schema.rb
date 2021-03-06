# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130430101924) do

  create_table "auths", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.text     "omni_hash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auths", ["provider", "uid"], :name => "index_auths_on_provider_and_uid", :unique => true
  add_index "auths", ["user_id"], :name => "index_auths_on_user_id"

  create_table "programs", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "url"
    t.string   "name",        :null => false
    t.string   "channel"
    t.text     "description"
    t.datetime "start_at",    :null => false
    t.datetime "end_at"
    t.string   "status"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "programs", ["parent_id"], :name => "index_programs_on_parent_id"
  add_index "programs", ["start_at"], :name => "index_programs_on_start_at"
  add_index "programs", ["uid"], :name => "index_programs_on_uid", :unique => true
  add_index "programs", ["user_id"], :name => "index_programs_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "key"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "email_active", :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["key"], :name => "index_users_on_key", :unique => true

end
