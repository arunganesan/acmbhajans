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

  create_table "backup_rendition", id: false, force: :cascade do |t|
    t.bigint "backup_id"
    t.bigint "rendition_as_backup_id"
  end

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

  create_table "instrumentalist_rendition", id: false, force: :cascade do |t|
    t.bigint "instrumentalist_id"
    t.bigint "rendition_as_instrumentalist_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "lead_rendition", id: false, force: :cascade do |t|
    t.bigint "lead_id"
    t.bigint "rendition_as_lead_id"
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
    t.integer "order"
    t.string "recording_url"
    t.string "shruti"
    t.integer "bhajan_id"
    t.integer "event_id"
    t.integer "weekend_id"
    t.index ["bhajan_id"], name: "index_renditions_on_bhajan_id"
    t.index ["event_id"], name: "index_renditions_on_event_id"
    t.index ["weekend_id"], name: "index_renditions_on_weekend_id"
  end

  create_table "satsangs", force: :cascade do |t|
    t.boolean "will_attend_practice"
    t.boolean "will_attend_satsang"
    t.boolean "attended_practice"
    t.boolean "attended_satsang"
    t.integer "weekend_id"
    t.integer "person_id"
    t.integer "practice_request_id"
    t.integer "practice_bhajan_id"
    t.integer "satsang_request_id"
    t.integer "satsang_bhajan_id"
    t.index ["person_id"], name: "index_satsangs_on_person_id"
    t.index ["practice_bhajan_id"], name: "index_satsangs_on_practice_bhajan_id"
    t.index ["practice_request_id"], name: "index_satsangs_on_practice_request_id"
    t.index ["satsang_bhajan_id"], name: "index_satsangs_on_satsang_bhajan_id"
    t.index ["satsang_request_id"], name: "index_satsangs_on_satsang_request_id"
    t.index ["weekend_id"], name: "index_satsangs_on_weekend_id"
  end

  create_table "soundsystem_rendition", id: false, force: :cascade do |t|
    t.bigint "soundsystem_id"
    t.bigint "rendition_as_soundsystem_id"
  end

  create_table "weekends", force: :cascade do |t|
    t.string "name"
  end

end
