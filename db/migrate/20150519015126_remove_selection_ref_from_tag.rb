class RemoveSelectionRefFromTag < ActiveRecord::Migration
  def change
    remove_reference :tags, :selection, index: true
    remove_foreign_key :tags, :selections
  end
end
