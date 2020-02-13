# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_13_102055) do

  create_table "car_users", force: :cascade do |t|
    t.integer "car_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "make"
    t.string "model"
    t.string "colour"
    t.string "registration_plate"
  end

  create_table "parking_zones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "control_zone"
    t.string "area_name"
    t.integer "tariff_per_hour"
  end

  create_table "spaces", force: :cascade do |t|
    t.integer "parking_zone_id"
    t.string "street_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "post_code"
    t.string "operational_hours"
    t.float "longitude"
    t.float "latitude"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "car_user_id"
    t.integer "space_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.integer "hours_purchased"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
  end

end
