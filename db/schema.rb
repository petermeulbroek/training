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

ActiveRecord::Schema.define(version: 20150418200143) do

  create_table "image_tags", force: :cascade do |t|
    t.integer  "image_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_tags", ["image_id"], name: "index_image_tags_on_image_id"

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.boolean  "reviewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selection_tags", force: :cascade do |t|
    t.integer  "selection_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "selection_tags", ["selection_id"], name: "index_selection_tags_on_selection_id"
  add_index "selection_tags", ["tag_id"], name: "index_selection_tags_on_tag_id"

  create_table "selections", force: :cascade do |t|
    t.integer  "start_x"
    t.integer  "start_y"
    t.integer  "end_x"
    t.integer  "end_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "type_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["type_id"], name: "index_tags_on_type_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
