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

ActiveRecord::Schema.define(:version => 20111023011745) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["hack_id"], :name => "index_comments_on_hack_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "eventdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active",              :default => false
    t.text     "stream_url"
    t.text     "access_token"
    t.text     "oauth_authorize_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hackdescriptionupdates", :force => true do |t|
    t.text     "description"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hackdescriptionupdates", ["hack_id"], :name => "index_hackdescriptions_on_hack_id"

  create_table "hackplatformrelations", :force => true do |t|
    t.integer  "platform_id"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hackplatformrelations", ["hack_id"], :name => "index_hackplatformrelations_on_hack_id"
  add_index "hackplatformrelations", ["platform_id"], :name => "index_hackplatformrelations_on_platform_id"

  create_table "hacks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "media_url"
    t.string   "info_url"
    t.integer  "votes"
    t.integer  "status_id"
  end

  create_table "invitations", :force => true do |t|
    t.string   "emailaddress"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  add_index "invitations", ["hack_id"], :name => "index_invitations_on_hack_id"

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statushackrelations", :force => true do |t|
    t.integer  "status_id"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statushackrelations", ["hack_id"], :name => "index_statushackrelations_on_hack_id"
  add_index "statushackrelations", ["status_id"], :name => "index_statushackrelations_on_status_id"

  create_table "user_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["hack_id"], :name => "index_votes_on_hack_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
