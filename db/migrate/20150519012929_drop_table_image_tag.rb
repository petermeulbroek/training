class DropTableImageTag < ActiveRecord::Migration
  def up
    drop_table :image_tags
  end

  def down
      create_table "image_tags", force: :cascade do |t|
        t.integer  "image_id"
        t.string   "name"
        t.string   "value"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end
      
      add_index "image_tags", ["image_id"], name: "index_image_tags_on_image_id"
  end
end
