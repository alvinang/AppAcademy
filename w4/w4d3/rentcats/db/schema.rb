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

ActiveRecord::Schema.define(version: 20140221011050) do

  create_table "cat_rental_requests", force: true do |t|
    t.integer  "cat_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id"

  create_table "cats", force: true do |t|
    t.integer  "age",        null: false
    t.date     "birth_date"
    t.integer  "user_id",    null: false
    t.string   "color",      null: false
    t.string   "name",       null: false
    t.string   "sex",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cats", ["user_id"], name: "index_cats_on_user_id"

  create_table "sessions", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "device"
    t.string   "token",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "user_name",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true

end
