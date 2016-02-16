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

ActiveRecord::Schema.define(version: 20160107003559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "category"
    t.text     "first_line"
    t.text     "last_line"
    t.string   "incorrect_one"
    t.string   "incorrect_two"
    t.string   "incorrect_three"
    t.string   "correct_answer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "teacher_id"
  end

  add_index "questions", ["teacher_id"], name: "index_questions_on_teacher_id", using: :btree

  create_table "student_classrooms", id: false, force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "classroom_id"
    t.integer  "teacher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.string   "favorite_team"
    t.integer  "game_wins",     default: 0
    t.integer  "game_losses",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name_prefix"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "school_name"
    t.string   "school_location"
    t.string   "school_city"
    t.string   "school_state"
    t.string   "classroom_name"
    t.string   "classroom_location"
    t.text     "classroom_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.boolean  "is_teacher",             default: false
    t.boolean  "is_student",             default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
