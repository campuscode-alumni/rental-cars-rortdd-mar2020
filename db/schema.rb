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

ActiveRecord::Schema.define(version: 2020_05_04_233617) do

  create_table "add_on_car_rentals", force: :cascade do |t|
    t.integer "add_on_id", null: false
    t.integer "car_rental_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["add_on_id"], name: "index_add_on_car_rentals_on_add_on_id"
    t.index ["car_rental_id"], name: "index_add_on_car_rentals_on_car_rental_id"
  end

  create_table "add_ons", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.string "serial_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_part_insurance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.integer "manufacturer_id", null: false
    t.integer "car_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fuel_type"
    t.string "motorization"
    t.integer "year"
    t.index ["car_category_id"], name: "index_car_models_on_car_category_id"
    t.index ["manufacturer_id"], name: "index_car_models_on_manufacturer_id"
  end

  create_table "car_rentals", force: :cascade do |t|
    t.integer "rental_id", null: false
    t.integer "car_id", null: false
    t.integer "user_id", null: false
    t.datetime "start_date"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_part_insurance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_rentals_on_car_id"
    t.index ["rental_id"], name: "index_car_rentals_on_rental_id"
    t.index ["user_id"], name: "index_car_rentals_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "car_model_id", null: false
    t.string "license_plate"
    t.integer "mileage"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "car_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.integer "customer_id"
    t.integer "status", default: 0
    t.index ["car_category_id"], name: "index_rentals_on_car_category_id"
    t.index ["customer_id"], name: "index_rentals_on_customer_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cnpj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "add_on_car_rentals", "add_ons"
  add_foreign_key "add_on_car_rentals", "car_rentals"
  add_foreign_key "car_models", "car_categories"
  add_foreign_key "car_models", "manufacturers"
  add_foreign_key "car_rentals", "cars"
  add_foreign_key "car_rentals", "rentals"
  add_foreign_key "car_rentals", "users"
  add_foreign_key "cars", "car_models"
  add_foreign_key "rentals", "car_categories"
  add_foreign_key "rentals", "customers"
end
