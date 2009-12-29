# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091228234857) do

  create_table "scores", :force => true do |t|
    t.integer  "score"
    t.integer  "scorable_id"
    t.string   "scorable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statements", :force => true do |t|
    t.string   "question"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "by"
    t.string   "by_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",      :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",                       :default => 0, :null => false
    t.integer  "failed_login_count",                :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "name"
    t.integer  "facebook_uid",         :limit => 8, :default => 0, :null => false
    t.string   "facebook_session_key"
    t.string   "image_thumb"
    t.string   "image_small"
    t.string   "image_large"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_whois",                     :default => 0
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "fk_voteables"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "uniq_one_vote_only", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "fk_voters"

  create_table "whois", :force => true do |t|
    t.integer  "version"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "by_link"
  end

end