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

ActiveRecord::Schema.define(version: 20160106180353) do

  create_table "classrooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "school",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "teacher_id", limit: 4
    t.integer  "student_id", limit: 4
  end

  create_table "questions", force: :cascade do |t|
    t.string   "category",        limit: 255
    t.text     "first_line",      limit: 65535
    t.text     "last_line",       limit: 65535
    t.string   "incorrect_one",   limit: 255
    t.string   "incorrect_two",   limit: 255
    t.string   "incorrect_three", limit: 255
    t.string   "correct_answer",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "teacher_id",      limit: 4
  end

  add_index "questions", ["teacher_id"], name: "index_questions_on_teacher_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name_first",    limit: 255
    t.string   "name_last",     limit: 255
    t.string   "email",         limit: 255
    t.string   "favorite_team", limit: 255
    t.integer  "game_wins",     limit: 4
    t.integer  "game_losses",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id",               limit: 4
    t.string   "name_prefix",           limit: 255
    t.string   "name_first",            limit: 255
    t.string   "name_last",             limit: 255
    t.string   "school_name",           limit: 255
    t.string   "school_location",       limit: 255
    t.string   "school_city",           limit: 255
    t.string   "school_state",          limit: 255
    t.string   "classroom_name",        limit: 255
    t.string   "classroom_location",    limit: 255
    t.text     "classroom_description", limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_admin",                           default: false
    t.boolean  "is_teacher",                         default: false
    t.boolean  "is_student",                         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
