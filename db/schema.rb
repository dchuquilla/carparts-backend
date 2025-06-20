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

ActiveRecord::Schema[8.0].define(version: 2025_06_17_025617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti", unique: true
  end

  create_table "proposals", force: :cascade do |t|
    t.decimal "price"
    t.string "currency", default: "USD"
    t.integer "delivery_time_days"
    t.integer "warranty_months"
    t.text "notes"
    t.string "status"
    t.bigint "request_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_proposals_on_request_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "user_phone", null: false
    t.string "user_name"
    t.string "user_email"
    t.string "part_name", null: false
    t.string "part_brand", null: false
    t.string "part_model", null: false
    t.integer "part_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "show_key"
    t.string "digest_key"
    t.string "part_image"
    t.string "part_chassis"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contact_email"
    t.string "contact_phone"
    t.text "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone", null: false
    t.string "store_name", null: false
    t.string "store_uid", null: false
    t.string "store_address"
    t.date "renew_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_uid"], name: "index_users_on_store_uid", unique: true
  end

  add_foreign_key "proposals", "requests"
  add_foreign_key "proposals", "users"
  add_foreign_key "stores", "users"
end
