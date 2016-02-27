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

ActiveRecord::Schema.define(version: 20160227155401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.integer  "school_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "classrooms", ["school_id"], name: "index_classrooms_on_school_id", using: :btree
  add_index "classrooms", ["user_id"], name: "index_classrooms_on_user_id", using: :btree

  create_table "classrooms_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "classroom_id"
  end

  add_index "classrooms_users", ["classroom_id"], name: "index_classrooms_users_on_classroom_id", using: :btree
  add_index "classrooms_users", ["user_id"], name: "index_classrooms_users_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "category"
    t.string   "first_line"
    t.string   "incorrect_one"
    t.string   "incorrect_two"
    t.string   "incorrect_three"
    t.string   "correct_answer"
    t.integer  "school_id"
    t.integer  "classroom_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "questions", ["classroom_id"], name: "index_questions_on_classroom_id", using: :btree
  add_index "questions", ["school_id"], name: "index_questions_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "mascot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "favorite_team",          default: "", null: false
    t.integer  "game_wins",              default: 0
    t.integer  "game_losses",            default: 0
    t.integer  "role",                   default: 0
    t.integer  "school_id"
    t.integer  "classroom_id"
  end

  add_index "users", ["classroom_id"], name: "index_users_on_classroom_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

end
