class AddAnnotationRefToShapes < ActiveRecord::Migration
  def change
    add_reference :shapes, :annotation, index: true
    add_foreign_key :shapes, :annotations
  end
end
