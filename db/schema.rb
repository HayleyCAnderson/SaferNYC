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

ActiveRecord::Schema.define(version: 20150111180944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incidents", force: true do |t|
    t.string   "borough"
    t.string   "key",                 null: false
    t.string   "date",                null: false
    t.float    "latitude",            null: false
    t.float    "longitude",           null: false
    t.string   "cross_street_name"
    t.string   "on_street_name"
    t.integer  "pedestrians_injured", null: false
    t.integer  "pedestrians_killed",  null: false
    t.integer  "cyclists_injured",    null: false
    t.integer  "cyclists_killed",     null: false
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cause"
    t.string   "vehicle_type"
  end

  add_index "incidents", ["date"], name: "index_incidents_on_date", using: :btree

end
