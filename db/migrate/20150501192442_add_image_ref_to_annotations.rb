class AddImageRefToAnnotations < ActiveRecord::Migration
  def change
    add_reference :annotations, :image, index: true
    add_foreign_key :annotations, :images
  end
end
