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

ActiveRecord::Schema[7.0].define(version: 2023_11_30_195429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.boolean "medal_winner"
    t.float "abv"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taproom_id", null: false
    t.index ["taproom_id"], name: "index_beers_on_taproom_id"
  end

  create_table "taprooms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.string "phone_number"
    t.integer "established"
    t.integer "number_of_employees"
    t.integer "serving_capacity"
    t.boolean "offers_food"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "beers", "taprooms"
end
