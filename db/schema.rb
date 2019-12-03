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

ActiveRecord::Schema.define(version: 2019_12_03_044449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_requirements", force: :cascade do |t|
    t.boolean "enabled", default: true
    t.bigint "career_id"
    t.bigint "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_career_requirements_on_career_id"
    t.index ["requirement_id"], name: "index_career_requirements_on_requirement_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirement_contents", force: :cascade do |t|
    t.boolean "enabled", default: true
    t.bigint "requirement_id"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_requirement_contents_on_content_id"
    t.index ["requirement_id"], name: "index_requirement_contents_on_requirement_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "user_badges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_user_badges_on_badge_id"
    t.index ["user_id"], name: "index_user_badges_on_user_id"
  end

  create_table "user_careers", force: :cascade do |t|
    t.boolean "enabled", default: true
    t.bigint "user_id"
    t.bigint "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_user_careers_on_career_id"
    t.index ["user_id"], name: "index_user_careers_on_user_id"
  end

  create_table "user_requirements", force: :cascade do |t|
    t.boolean "finished", default: false
    t.bigint "user_id"
    t.bigint "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
    t.string "requirement_name"
    t.index ["requirement_id"], name: "index_user_requirements_on_requirement_id"
    t.index ["user_id"], name: "index_user_requirements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "career_requirements", "careers"
  add_foreign_key "career_requirements", "requirements"
  add_foreign_key "requirement_contents", "contents"
  add_foreign_key "requirement_contents", "requirements"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
  add_foreign_key "user_careers", "careers"
  add_foreign_key "user_careers", "users"
  add_foreign_key "user_requirements", "requirements"
  add_foreign_key "user_requirements", "users"
end
