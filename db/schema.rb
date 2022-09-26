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

ActiveRecord::Schema[7.0].define(version: 2022_06_07_130704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.integer "age"
    t.text "description"
    t.bigint "enclosure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enclosure_id"], name: "index_animals_on_enclosure_id"
  end

  create_table "employee_enclosures", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "enclosure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_enclosures_on_employee_id"
    t.index ["enclosure_id"], name: "index_employee_enclosures_on_enclosure_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "enclosures", force: :cascade do |t|
    t.text "localization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "enclosure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description"
    t.index ["enclosure_id"], name: "index_events_on_enclosure_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "date"
    t.bigint "employee_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_notes_on_animal_id"
    t.index ["employee_id"], name: "index_notes_on_employee_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reservations_on_event_id"
  end

  add_foreign_key "animals", "enclosures"
  add_foreign_key "employee_enclosures", "employees"
  add_foreign_key "employee_enclosures", "enclosures"
  add_foreign_key "events", "enclosures"
  add_foreign_key "notes", "animals"
  add_foreign_key "notes", "employees"
  add_foreign_key "reservations", "events"
end
