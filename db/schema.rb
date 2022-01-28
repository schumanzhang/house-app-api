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

ActiveRecord::Schema.define(version: 2022_01_28_232539) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.float "rating"
    t.integer "sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agents_houses", id: false, force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "agent_id", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.integer "size"
    t.boolean "sold"
    t.integer "bed"
    t.integer "bath"
    t.integer "garage"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
