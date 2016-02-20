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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160218203441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "tweet_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interacted_tweets", force: :cascade do |t|
    t.integer  "tweet_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interacted_tweets", ["type"], name: "index_interacted_tweets_on_type", using: :btree

  create_table "related_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "related_id", null: false
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "body",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_social_accounts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "avatar"
    t.string   "first_name",      limit: 35,                 null: false
    t.string   "last_name",       limit: 35,                 null: false
    t.string   "email",           limit: 55,                 null: false
    t.string   "password_digest"
    t.boolean  "email_confirmed",            default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
