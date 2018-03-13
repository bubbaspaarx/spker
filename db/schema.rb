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

ActiveRecord::Schema.define(version: 20180313103622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_photos", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_photos_on_event_id"
  end

  create_table "event_tags", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_event_tags_on_category_id"
    t.index ["event_id"], name: "index_event_tags_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "postcode"
    t.date "start_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "location"
    t.string "talk_type"
    t.integer "attendance", default: 0
    t.text "description"
    t.boolean "expenses_flights"
    t.boolean "expenses_hotels"
    t.boolean "expenses_per_diems"
    t.date "end_date"
    t.boolean "is_paid"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_name"
    t.string "address"
    t.string "postcode"
    t.integer "proposal_cost"
    t.time "start_time"
    t.time "end_time"
    t.string "photo"
    t.integer "event_id"
    t.date "event_date"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "speaker_bookings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_speaker_bookings_on_event_id"
    t.index ["user_id"], name: "index_speaker_bookings_on_user_id"
  end

  create_table "user_bookings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_bookings_on_event_id"
    t.index ["user_id"], name: "index_user_bookings_on_user_id"
  end

  create_table "user_photos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_photos_on_user_id"
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_tags_on_category_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_speaker"
    t.text "address"
    t.text "postcode"
    t.float "latitude"
    t.float "longitude"
    t.integer "cost_cents", default: 0, null: false
    t.string "photo"
    t.integer "travel_distance"
    t.string "about"
    t.string "facebook"
    t.string "twitter"
    t.string "linkedin"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_photos", "events"
  add_foreign_key "event_tags", "categories"
  add_foreign_key "event_tags", "events"
  add_foreign_key "events", "users"
  add_foreign_key "speaker_bookings", "events"
  add_foreign_key "speaker_bookings", "users"
  add_foreign_key "user_bookings", "events"
  add_foreign_key "user_bookings", "users"
  add_foreign_key "user_photos", "users"
  add_foreign_key "user_tags", "categories"
  add_foreign_key "user_tags", "users"
end
