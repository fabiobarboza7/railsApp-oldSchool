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

ActiveRecord::Schema.define(version: 20181004014733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "photo"
    t.string   "photo_cache"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "duration"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
    t.string   "photo_cache"
    t.boolean  "is_free"
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id", using: :btree
    t.index ["user_id"], name: "index_enrollments_on_user_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "video"
    t.string   "file"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_lessons_on_subject_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_true"
    t.integer  "score"
    t.string   "questionable_type"
    t.integer  "questionable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["questionable_type", "questionable_id"], name: "index_questions_on_questionable_type_and_questionable_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
    t.integer  "score"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "done"
    t.index ["lesson_id"], name: "index_quizzes_on_lesson_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subjects_on_course_id", using: :btree
  end

  create_table "test_classes", force: :cascade do |t|
    t.string   "student"
    t.string   "age"
    t.string   "parent"
    t.string   "email"
    t.string   "phone"
    t.string   "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "score"
    t.boolean  "done"
    t.index ["lesson_id"], name: "index_tests_on_lesson_id", using: :btree
  end

  create_table "transictions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_target"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_transictions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "photo_cache"
    t.datetime "date_of_birth"
    t.string   "phone"
    t.boolean  "admin"
    t.integer  "age"
    t.integer  "score"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.decimal  "money"
    t.boolean  "is_verified", default: false
    t.index ["user_id"], name: "index_wallets_on_user_id", using: :btree
  end

  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "quizzes", "lessons"
  add_foreign_key "subjects", "courses"
  add_foreign_key "tests", "lessons"
  add_foreign_key "transictions", "users"
  add_foreign_key "wallets", "users"
end
