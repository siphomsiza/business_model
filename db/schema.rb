# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151129205947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "company_id"
    t.integer  "employee_id"
    t.string   "description"
    t.text     "info"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "appointments", ["company_id"], name: "index_appointments_on_company_id", using: :btree
  add_index "appointments", ["employee_id"], name: "index_appointments_on_employee_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contact_infos", force: true do |t|
    t.integer  "employee_id"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "work_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contact_infos", ["employee_id"], name: "index_contact_infos_on_employee_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "company_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  add_index "employees", ["username"], name: "index_employees_on_username", unique: true, using: :btree

  create_table "employees_roles", id: false, force: true do |t|
    t.integer  "role_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees_roles", ["employee_id"], name: "index_employees_roles_on_employee_id", using: :btree
  add_index "employees_roles", ["role_id"], name: "index_employees_roles_on_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
