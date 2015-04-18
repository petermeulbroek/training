class CreateImageTags < ActiveRecord::Migration
  def change
    create_table :image_tags do |t|
      t.belongs_to :image, index: true
      t.string :name
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :image_tags, :images
  end
end
