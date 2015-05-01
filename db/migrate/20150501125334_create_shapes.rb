class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.float :x
      t.float :y
      t.float :width
      t.float :height
      t.string :units

      t.timestamps null: false
    end
  end
end
