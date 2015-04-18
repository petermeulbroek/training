class CreateSelectionTags < ActiveRecord::Migration
  def change
    create_table :selection_tags do |t|
      t.references :selection, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :selection_tags, :selections
    add_foreign_key :selection_tags, :tags
  end
end
