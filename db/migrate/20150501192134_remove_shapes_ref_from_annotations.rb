class RemoveShapesRefFromAnnotations < ActiveRecord::Migration
  def change
    remove_column :annotations, :shapes_id, :reference
  end
end
