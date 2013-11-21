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

ActiveRecord::Schema.define(version: 20131121041024) do

  create_table "bundles", force: true do |t|
    t.string   "name"
    t.integer  "household_id"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bundles", ["household_id"], name: "index_bundles_on_household_id"

  create_table "households", force: true do |t|
    t.string   "name"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "households_users", id: false, force: true do |t|
    t.integer "household_id"
    t.integer "user_id"
  end

  add_index "households_users", ["household_id"], name: "index_households_users_on_household_id"
  add_index "households_users", ["user_id"], name: "index_households_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "collected"
    t.decimal  "budget",     precision: 15, scale: 12
    t.decimal  "cost",       precision: 15, scale: 12
    t.integer  "bundle_id"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widgets", ["bundle_id"], name: "index_widgets_on_bundle_id"

end
