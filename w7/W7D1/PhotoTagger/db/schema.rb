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

ActiveRecord::Schema.define(version: 20130828053306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photo_taggings", force: true do |t|
    t.integer  "photo_id",   null: false
    t.integer  "user_id",    null: false
    t.integer  "x_pos",      null: false
    t.integer  "y_pos",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_taggings", ["photo_id", "user_id"], name: "index_photo_taggings_on_photo_id_and_user_id", unique: true, using: :btree
  add_index "photo_taggings", ["photo_id"], name: "index_photo_taggings_on_photo_id", using: :btree
  add_index "photo_taggings", ["user_id"], name: "index_photo_taggings_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "owner_id",   null: false
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["owner_id"], name: "index_photos_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token",   null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
