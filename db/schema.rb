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

ActiveRecord::Schema.define(version: 20151230050708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "bump_event_matches", force: :cascade do |t|
    t.integer  "bump_event_id"
    t.integer  "matched_event_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "bump_event_matches", ["bump_event_id", "matched_event_id"], name: "index_bump_event_matches_on_bump_event_id_and_matched_event_id", unique: true, using: :btree
  add_index "bump_event_matches", ["bump_event_id"], name: "index_bump_event_matches_on_bump_event_id", using: :btree
  add_index "bump_event_matches", ["matched_event_id"], name: "index_bump_event_matches_on_matched_event_id", using: :btree

  create_table "bump_events", force: :cascade do |t|
    t.string    "device_id"
    t.geography "lonlat",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime  "created_at",                                                          null: false
    t.datetime  "updated_at",                                                          null: false
  end

  add_index "bump_events", ["lonlat"], name: "index_bump_events_on_lonlat", using: :gist

  add_foreign_key "bump_event_matches", "bump_events"
  add_foreign_key "bump_event_matches", "bump_events", column: "matched_event_id"
end
