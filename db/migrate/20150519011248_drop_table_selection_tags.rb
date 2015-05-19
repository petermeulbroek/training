class DropTableSelectionTags < ActiveRecord::Migration
  def up
    drop_table :selection_tags
  end

  def down
    
    create_table :selection_tags do |t|
      t.references :selection, index: true
      t.references :tag, index: true
      
      t.timestamps null: false
    end
  end
end
