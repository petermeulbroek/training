class AddImageRefToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :image, index: true
    add_foreign_key :tags, :images
  end
end
