class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :shapes, index: true
      t.string :src
      t.string :text

      t.timestamps null: false
    end
    add_foreign_key :annotations, :shapes
  end
end
