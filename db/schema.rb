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

ActiveRecord::Schema.define(version: 20190613213220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cages", force: :cascade do |t|
    t.string "status"
    t.string "species"
    t.integer "card_id"
    t.string "cage_id"
    t.string "type"
    t.string "sex"
    t.string "notes"
    t.date "pair_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiment_voles", force: :cascade do |t|
    t.bigint "experiment_id"
    t.bigint "vole_id"
    t.string "surgery_type"
    t.string "pain_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_experiment_voles_on_experiment_id"
    t.index ["vole_id"], name: "index_experiment_voles_on_vole_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_experiments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.string "location"
    t.string "state"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["location"], name: "index_users_on_location"
    t.index ["state"], name: "index_users_on_state"
  end

  create_table "voles", force: :cascade do |t|
    t.string "animal_id"
    t.string "sex"
    t.date "dob"
    t.date "P60"
    t.string "markings"
    t.string "free_use"
    t.string "status"
    t.string "notes"
    t.bigint "cage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cage_id"], name: "index_voles_on_cage_id"
  end

  add_foreign_key "experiment_voles", "experiments"
  add_foreign_key "experiment_voles", "voles"
  add_foreign_key "experiments", "users"
  add_foreign_key "voles", "cages"
end
