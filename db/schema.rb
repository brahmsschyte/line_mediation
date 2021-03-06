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

ActiveRecord::Schema.define(version: 20180328023910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "line_bots", force: :cascade do |t|
    t.string "app_name"
    t.string "app_description"
    t.string "channel_id"
    t.string "channel_secret"
    t.string "channel_access_token"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_line_bots_on_api_key", unique: true
  end

  create_table "line_events", force: :cascade do |t|
    t.jsonb "event"
    t.boolean "retrieved"
    t.bigint "line_bot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_bot_id"], name: "index_line_events_on_line_bot_id"
  end

  create_table "mogi_tracks", force: :cascade do |t|
    t.string "android_id"
    t.string "serial"
    t.string "annotation"
    t.float "altitude"
    t.float "speed"
    t.float "accuracy"
    t.float "latitude"
    t.float "longitude"
    t.datetime "time_id"
    t.boolean "retrieved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sms_delivery_reports", force: :cascade do |t|
    t.string "trx_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
