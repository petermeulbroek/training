class DropShapesIdFromAnnotations < ActiveRecord::Migration
  def change
    remove_column :annotations, :shape_id, :integer
  end
end
