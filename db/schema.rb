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

ActiveRecord::Schema.define(version: 2019_02_01_114225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "botanicals", force: :cascade do |t|
    t.string "botanical_name"
    t.string "slug"
    t.text "description"
    t.string "snippet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "botanicals_gins", force: :cascade do |t|
    t.integer "botanical_id"
    t.integer "gin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distilleries", force: :cascade do |t|
    t.string "distillery_name"
    t.string "snippet"
    t.text "description"
    t.string "website"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "gins", force: :cascade do |t|
    t.string "gin_name"
    t.string "snippet"
    t.text "description"
    t.float "abv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distillery_id"
    t.string "slug"
    t.boolean "alcoholic", null: false
    t.index ["gin_name"], name: "gins_gin_name_key", unique: true
  end

  add_foreign_key "gins", "distilleries"
  add_foreign_key "gins", "distilleries", name: "gins_distillery_id_fkey"
end
