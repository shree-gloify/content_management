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

ActiveRecord::Schema.define(version: 2019_07_11_083803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "project_languages", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "language", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_languages_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "index_project_members_on_project_id_and_user_id", unique: true
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "project_name", null: false
    t.text "project_description"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "release_comments", force: :cascade do |t|
    t.bigint "release_note_id", null: false
    t.bigint "user_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_note_id"], name: "index_release_comments_on_release_note_id"
    t.index ["user_id"], name: "index_release_comments_on_user_id"
  end

  create_table "release_notes", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.text "release_description", null: false
    t.float "release_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "release_number"], name: "index_release_notes_on_project_id_and_release_number", unique: true
    t.index ["project_id"], name: "index_release_notes_on_project_id"
    t.index ["user_id"], name: "index_release_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "allow_password_change", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "project_languages", "projects"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "release_comments", "release_notes"
  add_foreign_key "release_comments", "users"
  add_foreign_key "release_notes", "projects"
  add_foreign_key "release_notes", "users"
end
