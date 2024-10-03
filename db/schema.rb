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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_043126) do
  create_table "materials", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "store_name"
    t.string "phone"
    t.integer "rate"
    t.integer "paid_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["project_id"], name: "index_materials_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "name"
    t.string "phone"
    t.integer "rate"
    t.integer "paid_value"
    t.integer "worked_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.string "role"
    t.index ["project_id"], name: "index_workers_on_project_id"
  end

  add_foreign_key "materials", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "workers", "projects"
end
