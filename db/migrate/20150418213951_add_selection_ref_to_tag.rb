class AddSelectionRefToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :selection, index: true
    add_foreign_key :tags, :selections
  end
end
