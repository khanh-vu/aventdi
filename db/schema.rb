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

ActiveRecord::Schema.define(version: 20170721061656) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "business_addresses", force: :cascade do |t|
    t.string "name"
    t.integer "business_listing_id"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_listing_id"], name: "index_business_addresses_on_business_listing_id"
  end

  create_table "business_event_addresses", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id"], name: "business_event_addresses_address_id_index"
    t.index ["event_id"], name: "business_event_addresses_event_id_index"
    t.index ["id"], name: "business_event_addresses_id_index"
    t.index ["id"], name: "sqlite_autoindex_business_event_addresses_1", unique: true
  end

  create_table "business_event_categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.string "icon"
    t.string "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "marker"
    t.index ["parent_id"], name: "business_event_categories_parent_id_index"
  end

  create_table "business_events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_listing_id"
    t.integer "business_event_category_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["business_event_category_id"], name: "index_business_events_on_business_event_categories_id"
    t.index ["business_listing_id"], name: "index_business_events_on_business_listings_id"
  end

  create_table "business_listings", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.string "description"
    t.string "address"
    t.string "phone_number"
    t.integer "active"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_activities", force: :cascade do |t|
    t.integer "event_id", null: false
    t.string "activity_type", null: false
    t.text "content"
    t.integer "points", default: 0, null: false
    t.index ["event_id"], name: "event_activities_event_id_index"
    t.index ["id"], name: "sqlite_autoindex_event_activities_1", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
