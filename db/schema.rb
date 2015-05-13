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

ActiveRecord::Schema.define(version: 20150508173850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo_url"
    t.integer  "rank"
    t.string   "query_slug"
    t.string   "top_quote"
    t.string   "lat"
    t.string   "long"
    t.decimal  "popularity",  default: 0.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "category"
    t.integer  "city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "photo_url"
    t.string   "country"
    t.string   "description"
    t.decimal  "popularity",  default: 0.0
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "city_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_attractions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "attraction_id"
    t.integer  "city_id"
    t.boolean  "preference"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "username"
    t.string   "password_hash"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
