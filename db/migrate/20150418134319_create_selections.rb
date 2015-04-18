class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :start_x
      t.integer :start_y
      t.integer :end_x
      t.integer :end_y

      t.timestamps null: false
    end
  end
end
