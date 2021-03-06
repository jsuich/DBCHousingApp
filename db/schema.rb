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

ActiveRecord::Schema.define(version: 20130918230436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "street_address", null: false
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.integer  "zip",            null: false
    t.text     "json_string",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "gravatar"
    t.string   "twitter_handle"
    t.string   "facebook_handle"
    t.string   "cohort_name"
    t.integer  "cohort_id"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
