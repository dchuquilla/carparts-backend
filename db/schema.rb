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

ActiveRecord::Schema[8.0].define(version: 2025_03_05_054826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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
  end
end
