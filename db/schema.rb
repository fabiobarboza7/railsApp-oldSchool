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

ActiveRecord::Schema.define(version: 20190301025654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "file"
    t.index ["subject_id"], name: "index_attachments_on_subject_id", using: :btree
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "photo"
    t.string   "photo_cache"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
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
    t.string   "slug"
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

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "video"
    t.string   "file"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_lessons_on_slug", unique: true, using: :btree
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
    t.boolean  "answer"
    t.index ["questionable_type", "questionable_id"], name: "index_questions_on_questionable_type_and_questionable_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
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
    t.string   "slug"
    t.index ["course_id"], name: "index_subjects_on_course_id", using: :btree
    t.index ["slug"], name: "index_subjects_on_slug", unique: true, using: :btree
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
    t.integer  "course_id"
    t.index ["course_id"], name: "index_test_classes_on_course_id", using: :btree
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

  create_table "tutorials", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title"
    t.string   "subtitle"
    t.string   "video"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tutorials_on_course_id", using: :btree
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.boolean  "is_true"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "test_id"
    t.integer  "quiz_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id", using: :btree
    t.index ["quiz_id"], name: "index_user_answers_on_quiz_id", using: :btree
    t.index ["test_id"], name: "index_user_answers_on_test_id", using: :btree
    t.index ["user_id"], name: "index_user_answers_on_user_id", using: :btree
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
    t.string   "username"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.decimal  "money"
    t.boolean  "is_verified", default: false
    t.index ["user_id"], name: "index_wallets_on_user_id", using: :btree
  end

  add_foreign_key "attachments", "subjects"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "quizzes", "lessons"
  add_foreign_key "subjects", "courses"
  add_foreign_key "test_classes", "courses"
  add_foreign_key "tests", "lessons"
  add_foreign_key "transictions", "users"
  add_foreign_key "tutorials", "courses"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "quizzes"
  add_foreign_key "user_answers", "tests"
  add_foreign_key "user_answers", "users"
  add_foreign_key "wallets", "users"
end
