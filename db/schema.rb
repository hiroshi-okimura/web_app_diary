# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_01_081026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "web_app_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "web_app_id"], name: "index_bookmarks_on_user_id_and_web_app_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
    t.index ["web_app_id"], name: "index_bookmarks_on_web_app_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "web_app_id", null: false
    t.text "comment"
    t.integer "originality_score"
    t.integer "usability_score"
    t.integer "design_score"
    t.boolean "is_counted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "webapp_offer_date"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["web_app_id"], name: "index_reviews_on_web_app_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.integer "role", default: 0, null: false
    t.time "notify_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "web_apps", force: :cascade do |t|
    t.string "site_name", null: false
    t.string "url", null: false
    t.string "ogp_title"
    t.text "ogp_description"
    t.string "ogp_image"
    t.string "screenshot"
    t.date "offer_date"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "bookmarks", "web_apps"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "web_apps"
end
