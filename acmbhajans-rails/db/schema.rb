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

ActiveRecord::Schema.define(version: 20190819194834) do

  create_table "bhajans", force: :cascade do |t|
    t.string "name"
    t.string "beat"
    t.integer "speed"
    t.integer "deity_id"
    t.integer "raga_id"
    t.integer "language_id"
    t.index ["deity_id"], name: "index_bhajans_on_deity_id"
    t.index ["language_id"], name: "index_bhajans_on_language_id"
    t.index ["raga_id"], name: "index_bhajans_on_raga_id"
  end

  create_table "deities", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  create_table "people_ready_list", id: false, force: :cascade do |t|
    t.bigint "people_id"
    t.bigint "ready_list_id"
  end

  create_table "ragas", force: :cascade do |t|
    t.string "name"
    t.string "arohanam"
    t.string "avarohanam"
    t.string "anyasvara"
  end

  create_table "renditions", force: :cascade do |t|
    t.date "date"
    t.integer "lead_id"
    t.integer "bhajan_id"
    t.integer "order_id"
    t.integer "event_id"
    t.integer "sound_system_id"
    t.index ["bhajan_id"], name: "index_renditions_on_bhajan_id"
    t.index ["event_id"], name: "index_renditions_on_event_id"
    t.index ["lead_id"], name: "index_renditions_on_lead_id"
    t.index ["order_id"], name: "index_renditions_on_order_id"
    t.index ["sound_system_id"], name: "index_renditions_on_sound_system_id"
  end

  create_table "satsangs", force: :cascade do |t|
  end

end
