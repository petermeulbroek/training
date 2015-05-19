class DropSelectionTable < ActiveRecord::Migration
  def up
    drop_table :selections
  end
  
  def down
    create_table :selections do |t|
      t.integer :start_x
      t.integer :start_y
      t.integer :end_x
      t.integer :end_y
      t.integer :ordinal
      t.integer :image_id
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.string :units

      t.timestamps null: false
      
    end
  end
end
