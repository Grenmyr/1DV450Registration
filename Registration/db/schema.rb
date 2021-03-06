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

ActiveRecord::Schema.define(version: 20150224121042) do

  create_table "apis", force: :cascade do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "apis", ["user_id"], name: "index_apis_on_user_id"

  create_table "creators", force: :cascade do |t|
    t.integer  "submits"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "event_id"
    t.integer "type_id"
  end

  add_index "event_types", ["event_id"], name: "index_event_types_on_event_id"
  add_index "event_types", ["type_id"], name: "index_event_types_on_type_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.boolean  "edible"
    t.integer  "taste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
  end

  create_table "positions", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.integer  "amount"
    t.integer  "event_id"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["event_id"], name: "index_positions_on_event_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
